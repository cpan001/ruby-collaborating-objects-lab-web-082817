require 'pry'
require_relative './song.rb'
require_relative './artist.rb'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files_array = Dir.entries(path).reject {|file| file.start_with?(".")}
  end

  def import
    self.files.each do |file|
      song = Song.new_by_filename(file)
      song.artist.add_song(song)
      song_artist = song.artist.name
      if !(Artist.all.find {|a| a.name == song_artist})
        Artist.all << song.artist
      end
    end
  end

end

# a = MP3Importer.new("./spec/fixtures/mp3s")
#
#
#
# ""
