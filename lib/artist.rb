class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        art = self.all.find{|artist| artist.name == name}
        if art == nil
          self.new(name)
        else
          art 
        end
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end