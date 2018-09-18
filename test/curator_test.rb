require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test

  def setup
    @photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    @photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

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

    photograph_1 = Photograph.new(@photo_1)
    photograph_2 = Photograph.new(@photo_2)
    

    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)

    assert_equal [photograph_1, photograph_2], @curator.photographs
    assert_equal @photo_1, @curator.photographs.first
    # require 'pry'; binding.pry
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @curator.photographs.first.name
  end

end