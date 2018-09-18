require './lib/photograph'
require './lib/artist'

class Curator

  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo_hash)
    @photographs << Photograph.new(photo_hash)
  end

  def add_artist(artist_hash)
    @artists << Artist.new(artist_hash)
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end
  
end