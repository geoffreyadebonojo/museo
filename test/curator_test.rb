require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test

  def setup
    
    attributes = {
    }
    @curator = Curator.new(attributes)
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_artists_and_photographs_init_empty
    assert_equal [], @curator.artists
    assert_equal [], @curator.photographs
  end

  def test_it_can_add_photographs
    
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    @curator.add_photograph(photo_1)
    @curator.add_photograph(photo_2)

    assert_equal 2, @curator.photographs.count
    assert_instance_of Photograph, @curator.photographs.first
    # require 'pry'; binding.pry
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @curator.photographs.first.name
  end


  def test_it_can_add_artists

    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    }      
    
    artist_2 = {
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States" 
    }

      @curator.add_artist(artist_1)
      @curator.add_artist(artist_2)

      assert_equal 2, @curator.artists.count
      assert_instance_of Artist, @curator.artists.first
      
      assert_equal "Henri Cartier-Bresson", @curator.artists.first.name
  end

  def test_it_FIND_artist_by_id

    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    }      
    
    artist_2 = {
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States" 
    }

      @curator.add_artist(artist_1)
      @curator.add_artist(artist_2)

      entry = @curator.find_artist_by_id("1")
      assert_equal "1", entry.id
      assert_equal "Henri Cartier-Bresson", entry.name
  end

  def test_it_FIND_photo_by_id

    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    @curator.add_photograph(photo_1)
    @curator.add_photograph(photo_2)
    
    entry = @curator.find_photograph_by_id("1")
    assert_equal "1", entry.id
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", entry.name
  end


end