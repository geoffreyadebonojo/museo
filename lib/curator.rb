require './lib/photograph'
require './lib/artist'

class Curator

  attr_reader :artists, :photographs

  def initialize(attributes)
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
  
end