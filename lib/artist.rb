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
    Song.all.select do |song| 
      song.artist == self
    end 
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(artist_name)
    artist = self.all.find do |a| 
      a.name = artist_name
    end
    if !artist 
      artist = Artist.new(artist_name)
    end
    artist
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end


end
