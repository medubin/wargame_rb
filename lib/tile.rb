require 'ruby2d'
class Tile
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  # For debugging only
  def to_s
    'o'
  end

end