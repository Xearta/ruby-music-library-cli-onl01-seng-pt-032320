require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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
    artist.add_song(self)
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
    song = self.new(song_name, artist_name, genre)
    binding.pry
    #song = find_or_create_by_name(song_name)
    #song.artist=(artist_name)
    #binding.pry
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
