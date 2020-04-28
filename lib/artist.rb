class Artist
    attr_accessor :name , :songs
    @@all = []

    def initialize(n)
        @name = n
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name(n)
        artist = self.all.find do |a|
            a.name == n
        end
        if artist != nil
            return artist
        else
            return self.new(n)
        end
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end



end