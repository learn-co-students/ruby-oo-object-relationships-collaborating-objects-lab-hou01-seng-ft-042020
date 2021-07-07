class MP3Importer
    attr_accessor :path, :files
    @@all = []

    def initialize(path)
        @path = path
    end

    def self.all
        @@all
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end
  
    def import
     files.each {|filename| Song.new_by_filename(filename)}
        # binding.pry
    end


    
end