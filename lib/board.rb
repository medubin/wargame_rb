require 'ruby2d'
require_relative 'tile'
require_relative 'constants/board'
require_relative 'constants/tile'


class Board
  attr_accessor :field
  def initialize(width, height)
    @field = Array.new(height) { |y| Array.new(width) { |x| Tile.new(x, y)}}
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

  def move_unit(unit, x, y)
    new_x = unit.x + x
    new_y = unit.y + y
    if new_x.between?(0, WIDTH - 1) && new_y.between?(0, HEIGHT - 1) 
      end_tile = @field[new_y][new_x]
      unit.move(end_tile)
    end
  end

  # For debugging only
  def to_s()
    str = ''
    @field.each do |y|
      str += y.join + "\n"
    end
  str
  end
end