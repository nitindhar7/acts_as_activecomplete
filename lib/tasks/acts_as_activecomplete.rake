namespace :acts_as_activecomplete do
  
  namespace :build do
    
    desc "Build the data structures"
    task :structures => :environment do
      File.new( "tmp/words", "w+" )
      File.new( "tmp/correlations", "w+" )
      File.new( "tmp/queries", "w+" )
    end
    
    desc "Build the words index"
    task :words => :environment do
      @file = File.open( "tmp/words", 'w+' )
      
      for post in Post.all
        words = post.body.split( " " )
        for word in words
          puts word
=begin
            @word = Word.find( :first, :conditions => "text = '#{word}'" )
            
            if @word.nil?
              Word.create( { :text => word } )
            else
              @word.frequency += 1
              @word.save
            end
          rescue
            puts "#{word} not saved!"
=end  
        end
      end
    end
    
  end
  
end