require "pry"
require_relative "artist.rb"
require_relative "song.rb"
require_relative "mp3_importer.rb"

class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        artist = self.all.find{|artist| artist.name = artist_name}
        if !artist
            artist = Artist.new(artist_name)
        end
        artist
    end

    def print_songs
        songs.each{|song| puts song.name}

    end


end

# binding.pry
# 0
