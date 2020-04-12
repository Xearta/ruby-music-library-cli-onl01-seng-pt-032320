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
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")

    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    # artist_name, song_name, genre, mp3 = filename.split(/[-.]/)
    # artist_name.strip!
    # song_name.strip!
    # genre.strip!
    # song = self.new(song_name, artist_name, genre)
    # binding.pry
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
