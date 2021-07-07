require "pry"
require_relative "artist.rb"
require_relative "mp3_importer.rb"

class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_split = filename.split(" - ")
        new_song = self.new(song_split[1])
        new_song.artist_name = song_split[0]
        return new_song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
        # binding.pry
    end
 
end
