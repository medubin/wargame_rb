require 'ruby2d'
class Tile
  attr_reader :x, :y
  attr_accessor :unit
  def initialize(x, y)
    @x = x
    @y = y
    @unit = nil
    @square = nil
  end

  def toggle_select
    if (@square)
      @square.remove()
      @square = nil
    else
      @square = Square.new(
        x: @x * TILE_WIDTH, 
        y: @y *TILE_HEIGHT,
        size: TILE_WIDTH,
        color: 'blue',
        z: 1,
      )
    end
  end
end