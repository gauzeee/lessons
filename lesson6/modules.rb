module CompanyName
  attr_accessor :company_name
end


module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances
  end

  module InstanceMethods
    private
    def register_instanse
      self.class.instances = 0 if self.class.instances == nil
      self.class.instances += 1
    end
  end
end
