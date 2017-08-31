require 'pry'
require_relative './song.rb'
require_relative './mp3_importer.rb'

class Artist

  attr_accessor :name

  @@all = [] #all artists

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end


  def self.find_or_create_by_name(artistname)
    artist_obj = self.all.find { |artist| artist.name == artistname}
    artist_obj ? artist_obj : Artist.new(artistname)
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

end

# binding.pry
#
# ""
