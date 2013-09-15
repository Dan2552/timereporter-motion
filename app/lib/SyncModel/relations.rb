module SyncModel
  module Relations

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def belongs_to symbol
        define_method(symbol) do |*args, &block|
          remote_id = send("remote_#{symbol}_id")
          if remote_id
            return constant(symbol).find(remote_id: remote_id)
          end
          local_id = send("#{:symbol}_id")
          if local_id
            return constant(symbol).find(id: local_id)
          end
          nil
        end
      end

    end

    private

    def constant symbol
      symbol.camelize.constantize
    end

  end
end
