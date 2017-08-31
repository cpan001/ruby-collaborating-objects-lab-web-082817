require 'pry'
require_relative './artist.rb'
require_relative './mp3_importer.rb'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name(name)
    self.artist = Artist.new(name)
  end

  def self.new_by_filename(file_name)
    filename = file_name.split(" - ")
    songname = filename[1]
    artistname = filename[0]
    song = Song.new(songname)
    song.artist_name(artistname)
    song
  end

end

# binding.pry
#
# ""
