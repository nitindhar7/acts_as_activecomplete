namespace :activecomplete do
  
  namespace :build do
    
    desc "Build the words index"
    task :words, :model, :needs => :environment do |t, args|
      args[:model].capitalize.constantize.create_words
    end
    
  end
  
end