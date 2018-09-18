require './lib/photograph'

class Curator

  attr_reader :artists, :photographs

  def initialize(attributes)
    @artists = []
    @photographs = []
  end

  def add_photograph(photo_hash)
    @photographs << Photograph.new(photo_hash)
  end

end