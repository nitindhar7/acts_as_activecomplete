module ActsAsActiveomplete
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def acts_as_activecomplete(*options)
      cattr_accessor :activecompleted_fields
      self.activecompleted_fields = options
      send :include, InstanceMethods
    end
    
    def create_words
      File.open "#{Rails.root}/tmp/#{self.downcase}_words.activecomplete", "w"
      for field in self.activecompleted_fields
        
      end
    end
    
    def create_correlations
      File.open "#{Rails.root}/tmp/#{self.downcase}_correlations.activecomplete", "w"
    end
  end

  module InstanceMethods
  end
end

ActiveRecord::Base.send :include, ActsAsActiveomplete