module ActsAsActiveomplete
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def acts_as_activecomplete
      send :include, InstanceMethods
    end
  end

  module InstanceMethods
  end
end

ActiveRecord::Base.send :include, ActsAsActiveomplete