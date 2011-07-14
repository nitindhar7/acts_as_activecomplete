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
      @words = File.open( "#{Rails.root}/tmp/#{self.to_s.downcase}_words.activecomplete", "w" )
      for field in self.activecompleted_fields
        corpus = self.send :find, :all, :select => field
        for document in corpus
          # to access the column: document.send field

          # TODO
          # (1) parse document
          line = document.send field
          terms = line.split( " " )
          # (2) generate stats
          # (3) create divides between each field
        end
      end
    end
    
    def create_correlations
      File.open( "#{Rails.root}/tmp/#{self.downcase}_correlations.activecomplete", "w" )
    end
  end

  module InstanceMethods
  end
end

ActiveRecord::Base.send :include, ActsAsActiveomplete