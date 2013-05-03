module ModelSync

  module SyncableColumns
    def self.included(base)
      base.extend(PublicClassMethods)
    end

    module PublicClassMethods
      def columns(*fields)
        unless self.respond_to?(:id)
          add_field(:id, :integer)
        end
        unless self.respond_to?(:remote_id)
          add_field(:remote_id, :integer)
        end
        super
      end
    end
  end

  class Base
    include MotionModel::Model
    include MotionModel::FMDBModelAdapter
    include SyncableColumns

    def self.get(params={}, &object)
      Network.get self, params do |response|

        fetched_object = false
        if response.body
          # puts "GET--------"
          # puts response.body.to_str
          # puts "/GET-------"
          json = Json.parse(response.body.to_str)
          #puts "json>> #{json}"
          fetched_object = update_or_create(json)
        end
        object.call(fetched_object) if object
      end
    end

    def post(params={}, &object)
      Network.post self, params do |response|
        json = Json.parse(response.body.to_str)
        json["id"] = self.id
        fetched_object = update_attributes(json)
        object.call(fetched_object) if object
      end
    end

    def self.update_or_create params
      if params.is_a? Array
        return params.map { |p| update_or_create(p) }
      end

      remote_id = params[:remote_id] || params["remote_id"]

      remote = find_by :remote_id, remote_id

      if remote
        remote.update_attributes(params)
      else
        create(params)
      end
    end

    def self.find_by attribute, value
      return nil if value.nil?
      where(attribute => value).first
    end

    def to_hash
      hash = {}
      self.columns.each{ |column| hash[column] = self.send(column) }
      hash
    end

    def payload
      BW::JSON.generate({ self.class.to_s.downcase => Json.foreignize(to_hash) })
    end
  end

  class NetworkQueue

    PRIORITIES = [:auth, :sync, :other]

    def setup_queue
      @queue = {}
      PRIORITIES.each { |key| @queue[key] = [] }
      @queue
    end

    def queue
      @queue || setup_queue
    end

    def add(proc, priority=:other)
      queue[priority] << proc
    end

    def running?
      @running == true
    end

    def execute
      return if running?
      @running = true
      #puts "QUEUE======== EXECUTING QUEUE #{verbose_count}"
      n = next_call
      n.execute if n.respond_to? :execute
    end

    def unlock_and_continue
      @running = false
      execute
    end

    def verbose_count
      PRIORITIES.map{|key| queue[key].count}.join(" ")
    end

    def count
      PRIORITIES.map{|key| queue[key].count}.inject(0, :+)
    end

    private

    def next_call
      PRIORITIES.each do |key|
        level_queue = queue[key]
        unless level_queue.empty?
          @pop = level_queue.delete_at(0)
          #puts "QUEUE======== executing #{key} #{@pop.class} #{@pop.to_s}"
          return @pop
        end
      end
      #puts "QUEUE======== END OF QUEUE"
      @running = false
      nil
    end
  end

  class Network

    def self.queue_status
      @@network_queue.verbose_count
    end

    @@network_queue = NetworkQueue.new
    @@open_calls = []
    [:get, :post, :put, :delete, :head, :patch].each do |http_verb|
     define_singleton_method(http_verb) do |cls, params, &block|
        payload = cls.payload if cls.respond_to?(:payload)

        options = {
          payload: payload || "",
          headers: { "X-Csrf-Token" => App::Persistence['csrf']},
          format: :json
        }

        instance_params = {
          verb: http_verb,
          url: Routing.action(cls, params),
          callback: block,
          options: options
        }

        priority = params[:priority] || :other

        new(instance_params).add_to_queue(priority)
     end
    end

    def initialize params
      @verb = params[:verb]
      @url = params[:url]
      @callback = params[:callback]
      @options = params[:options]
    end

    def execute
      BW::HTTP.send @verb, @url, @options do |response|

      puts "got response #{response.status_code} #{response.status_code.nil?} #{response.status_code.is_a?(Fixnum)}"
        @response = response
        watch_for_csrf_token

        if response.status_code == 401
          auth_action
          add_to_queue
        else
          @callback.call(response)
        end
        @@network_queue.unlock_and_continue
      end
    end

    def to_s
      "#{@verb}: #{@url}"
    end

    def add_to_queue(priority=:other)
      @@network_queue.add(self, priority)
      @@network_queue.execute
    end

    private

    def auth_action
      Store.auth_action.call
    end

    def watch_for_csrf_token
      if @response.headers && @response.headers.include?("X-Csrf-Token")
        App::Persistence['csrf'] = @response.headers["X-Csrf-Token"]
      end
    end
  end




  class Routing
    def self.action(cls, params={})
      params = { action: params } if params.is_a? Symbol

      action = params.delete(:action) || :index
      cls = cls.class unless cls.is_a? Class
      action_location = ""
      action_location = "/#{action}" unless action.to_sym == :index
      html_params = build_params params
      action_location = "#{cls.to_s.pluralize.underscore}#{action_location}.json#{html_params}"
      "#{ModelSync::Store.host}/#{action_location}"
    end

    def self.build_params params
      return "" if params.keys.count < 1
      str = "?"
      params.each_with_index do |(k, v), i|
        str = "#{str}#{i>0?"&":""}#{k}=#{v}"
      end
      str
    end
  end





  class Store

    def self.host= set_host
      @host = set_host
    end

    def self.host
      @host ||= "http://localhost:3000"
    end

    def self.auth_action= auth_action
      @auth_action = auth_action
    end

    def self.auth_action
      @auth_action || (-> {})
    end
  end






  class Json
    def self.parse string
      parsed = BW::JSON.parse string
      localize(parsed)
    end

    def self.localize object
      if object.class == Array
        return object.map { |child| localize(child) }
      end

      object = object.dup
      object["remote_id"] = object.delete("id")
      object["remote_updated_at"] = object.delete("updated_at")
      object["remote_created_at"] = object.delete("created_at")
      object
    end

    def self.foreignize object
      if object.class == Array
        return object.map { |child| foreignize(child) }
      end

      object = object.dup
      object[:mobile_id] = object.delete(:id)
      object[:id] = object.delete(:remote_id)
      object
    end
  end

end
