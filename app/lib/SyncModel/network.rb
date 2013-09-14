module SyncModel
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
        puts "#{self} http response, status code: (#{response.status_code})"
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
      Settings.auth_action.call
    end

    def watch_for_csrf_token
      if @response.headers && @response.headers.include?("X-Csrf-Token")
        App::Persistence['csrf'] = @response.headers["X-Csrf-Token"]
      end
    end
  end
end
