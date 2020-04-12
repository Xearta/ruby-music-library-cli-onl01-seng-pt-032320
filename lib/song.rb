require 'pry'

class Song
  extend Concerns::Findable
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
    artist_name, song_name, genre, mp3 = filename.split(/[-.]/)
    artist_name.strip!
    song_name.strip!
    genre.strip!
    song = find_or_create_by_name(song_name)
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
