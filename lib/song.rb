require 'pry'

class Song
  attr_accessor :name
  @@all = []

  def initialize(name, artist="", genre="")
    @name = name

    if artist != "" || genre != ""
      self.artist=(artist)
      self.genre=(genre)
    end
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if not self.genre.songs.include?(self)
      self.genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    #binding.pry
    #filename = filename.split('.mp3')
    artist_name, song_name, genre, mp3 = filename.split(/[-.]/)
    #binding.pry
    # song = self.create(song_name)
    # song.artist=(artist_name)
    # song.genre=(genre)
    #song
  end

  def self.create_from_filename(filename)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end
