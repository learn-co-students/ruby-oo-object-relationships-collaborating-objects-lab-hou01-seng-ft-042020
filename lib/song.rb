class Song
    attr_accessor :name , :artist
    @@all = []

    def initialize(n)
        @name = n
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.new_by_filename(file)
    #     array = file.split(" - ")
    #     artist = array[0]
    #     song = array[1]
    #     new_song = self.new(song)
    #     new_song.artist_name = artist
    #     return new_song
    # end

    def self.new_by_filename(filename)
        artist, song = filename.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
      end




    def artist_name=(n)
        self.artist = Artist.find_or_create_by_name(n)
        artist.add_song(self)
    end






end