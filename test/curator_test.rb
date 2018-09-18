require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test

  def setup
    @curator = Curator.new
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
    
    entry = @curator.find_photograph_by_id("2")
    assert_equal "2", entry.id
    assert_equal "Moonrise, Hernandez", entry.name
  end

  def test_it_FINDS_photos_by_artist
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
    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
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
    artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    curator = Curator.new
    #=> #<Curator:0x00007fa3c182da18...>
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    diane_arbus = curator.find_artist_by_id("3")
    curator.find_photographs_by_artist(diane_arbus)
  end


  def test_it_FINDS_artists_with_multiple_photos


  end


  def test_it_FINDS_photos_taken_by_artists_from_place


  end


end