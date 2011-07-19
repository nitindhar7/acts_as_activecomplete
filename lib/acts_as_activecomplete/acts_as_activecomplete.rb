module ActsAsActiveomplete
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    class Parser
      def parse(line)
        line.split( " " )
      end
    end
    
    def acts_as_activecomplete(*options)
      cattr_accessor :activecompleted_fields
      self.activecompleted_fields = options
      send :include, InstanceMethods
    end
    
    def create_words
      @parser = Parser.new
      @words = File.open( "#{Rails.root}/tmp/#{self.to_s.downcase}_words.ac", "w" )
      for field in self.activecompleted_fields
        corpus = self.send :find, :all, :select => field
        for document in corpus
          @parser.parse( document.send field )
          
          for word in terms
            @words.puts word
          end
          
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