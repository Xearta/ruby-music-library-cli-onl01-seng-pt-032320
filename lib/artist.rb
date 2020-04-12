require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def genres
    all_genres = []
    self.songs.each { |song| all_genres << song.genre }
    all_genres.uniq
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if not self.songs.include?(song)
      self.songs << song
    end
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
