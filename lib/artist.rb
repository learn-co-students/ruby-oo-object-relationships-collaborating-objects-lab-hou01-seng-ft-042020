require "pry"
require_relative "song.rb"
require_relative "mp3_importer.rb"


class Artist
    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_by_name(name)
        self.all.detect{|x| x.name == name}
      #returns fasley if artist name isnt found
    end

    def self.create_by_name(name)
        artist = self.new(name)
        return artist
    end
        

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create_by_name(name)
        #if find_by returned false, it moves on to create by
        #using or || means one or the other should be true 
    end

    def print_songs
        songs.each{|x| puts x.name}
    end


end