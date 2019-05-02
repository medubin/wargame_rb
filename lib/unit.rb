require "ruby2d"


class Unit 
attr_reader :circle
  def initialize(tile)
    @tile = tile
  end
  
  def display
    @circle = Circle.new(
      x: @tile.x * TILE_WIDTH + (TILE_WIDTH / 2),
      y: @tile.y * TILE_HEIGHT + (TILE_HEIGHT / 2),
      radius: 10,
      color: 'red',
      z: 1
    )
  end

  def x
    @tile.x
  end

  def y
    @tile.y
  end

  def move(new_tile)
    @tile = new_tile
    redraw
  end

  private
  def redraw
    @circle.x = @tile.x * TILE_WIDTH + (TILE_WIDTH / 2)
    @circle.y = @tile.y * TILE_HEIGHT + (TILE_HEIGHT / 2)
  end

end