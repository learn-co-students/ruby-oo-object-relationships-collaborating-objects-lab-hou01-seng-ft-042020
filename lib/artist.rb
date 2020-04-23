require 'pry' 

    class Artist
    attr_accessor :name 
    @@all=[]

    def initialize(name)
        @name=name
        save
    end
    
    def save
        @@all << self
    end

    def self.all
        @@all 
    end 

    def add_song(song)
        song.artist=self 
    end 

    def songs
        Song.all.select do |x| x.artist == self end 
    end 

    def self.find_or_create_by_name(artist)
    if !self.all.find do |x| x.name == "#{artist}" end 
        artist=Artist.new(artist)
    else
        self.all.find do |x| x.name == "#{artist}" end 
    end
    end

    def print_songs
        songs.each {|song| puts song.name}
    end 
end 