require './lib/photograph'
require './lib/artist'
require 'pry'

require './lib/file_io'

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

  def artists_with_multiple_photographs
    @artists.find_all do |artist|
      find_photographs_by_artist(artist).count > 1
    end
  end

  def photographs_taken_by_artists_from(country)
   
    artists_from = @artists.find_all do |artist|
      artist.country == country
    end

    artist_ids = artists_from.map do |artist|
      artist.id
    end
    
    @photographs.keep_if do |photo|
      artist_ids.include?(photo.artist_id)
    end 
  end
  
  def load_photographs(path)
    photo_files = FileIO.load_photographs(path)
    photo_files.each do |hash|
      @photographs << Photograph.new(hash)
    end
  end

  def load_artists(path)
    artist_files = FileIO.load_artists(path)
    artist_files.each do |hash|
      @artists << Artist.new(hash)
    end
  end

end