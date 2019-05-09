require 'ruby2d'
require_relative 'tile'
require_relative 'constants/board'
require_relative 'constants/tile'


class Board
  def initialize(width, height)
    @field = Array.new(height) { |y| Array.new(width) { |x| Tile.new(x, y)}}
  end

  def select_tile(x, y)
    if self[x,y].unit
      moves = self[x,y].unit.get_moves
      moves.each do |move|
        new_x = x + move[0]
        new_y = y + move[1] 
        self[new_x, new_y ].toggle_select if valid_coordinates(new_x, new_y)
      end
    end
  end

  def place_unit(x, y, unit)
    @field[y][x].unit = unit
    unit.display(@field[y][x])
  end

  def display
   WIDTH.times do |x|
    Line.new(
      x1: x * TILE_WIDTH, y1: 0,
      x2: x * TILE_WIDTH, y2: PIXEL_HEIGHT,
      width: 1,
      color: 'lime',
      z: 1
    )
    end

    HEIGHT.times do |y|
      Line.new(
        x1: 0,           y1: y * TILE_HEIGHT,
        x2: PIXEL_WIDTH, y2: y * TILE_HEIGHT,
        width: 1,
        color: 'lime',
        z: 1
      )
      end
  end

  def move_unit(origin_x, origin_y, add_x, add_y)
    new_x = origin_x + add_x
    new_y = origin_y + add_y
    if !valid_coordinates(new_x, new_y)
      return
    end
  
    tile = self[origin_x,origin_y]
  
    if (tile && tile.unit)
      new_tile = self[origin_x + add_x, origin_y + add_y]
      new_tile.unit = tile.unit
      tile.unit = nil
      new_tile.unit.move(new_tile)
    end
  end

  private
  def [](x, y)
    @field[y][x]
  end

  def valid_coordinates(x, y)
    x.between?(0, WIDTH - 1) && y.between?(0, HEIGHT - 1)
  end
end