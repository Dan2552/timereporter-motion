module SyncModel
  module Relations

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def belongs_to symbol
        define_method(symbol) do |*args, &block|
          remote_id = send("remote_#{:project}_id")

          local_id = send("#{:project}_id") unless remote_id
          symbol.camelize.constantize.find(id: id)
        end
      end

      def has_many symbol
        puts "has_many"
      end
    end

  end
end
