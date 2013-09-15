module ActiveRecordLike

  def self.included(base)
    base.extend(ClassMethods)

    base.class_eval do
      class << self
        alias_method :where, :find
      end
    end
  end

  def attributes
    hash = {}
    self.class.attributes.each do |a|
      hash[a] = self.send(a)
    end
    hash
  end

  def attributes= set_attrs
    set_attrs.each do |a, new_value|
      self.send("#{a}=", new_value) if respond_to?("#{a}=")
    end
  end

  def update set_attrs
    self.attributes = set_attrs
    save
  end

  module ClassMethods

    # def find *args
    #   #where(args).first

    #   "potatoes"
    # end

    def delete_all
      all.each { |r| r.delete }
    end

    def destroy_all
      delete_all
    end

    def first
      all.first
    end

    def last
      all.last
    end
  end
end
