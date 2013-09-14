module Old



    def self.find_by attribute, value
      return nil if value.nil?
      where(attribute => value).first
    end



    # def method_missing(meth, *args)
    #   if respond_to?(obj_c_meth)
    #     send obj_c_meth, *args
    #   else
    #     raise NoMethodError.new(meth.to_s)
    #   end
    # end

    private

    def has_relationship? symbol
      #e.g. TimeEntry belongs_to Project -> :project
      #e.g. Project has_many TimeEntry -> :time_entries

      return false if symbol == :remote

      if plural? symbol

      else
        project_id
      end
    end

    def relationship symbol

    end

    def plural? symbol
      symbol.to_s[-1] == "s"
    end














 # class Store

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
 # end



end
