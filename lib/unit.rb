require "ruby2d"


class Unit 
attr_reader :circle, :x, :y
  def initialize()
    @x = nil
    @y = nil
    @move = 2
  end

  def get_moves
    moves = []
    (-1 * @move).upto(@move) do |x|
      (-1 * @move).upto(@move) do |y|
        moves << [x,y] if (x.abs + y.abs) <= @move
      end
    end
    moves
  end
  
  def display(tile)
    @x = tile.x
    @y = tile.y
    @circle = Circle.new(
      x: tile.x * TILE_WIDTH + (TILE_WIDTH / 2),
      y: tile.y * TILE_HEIGHT + (TILE_HEIGHT / 2),
      radius: 10,
      color: 'red',
      z: 2
    )
  end

  def move(new_tile)
    @x = new_tile.x
    @y = new_tile.y
    redraw new_tile
  end

  private
  def redraw(tile)
    @circle.x = tile.x * TILE_WIDTH + (TILE_WIDTH / 2)
    @circle.y = tile.y * TILE_HEIGHT + (TILE_HEIGHT / 2)
  end

end