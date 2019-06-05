require "ruby2d"
require_relative "./constants/terrain"

class Terrain
    attr_accessor :north, :south, :west, :east
    attr_reader :col, :row
  def initialize(row, col)
    @row = row
    @col = col
    @unit = nil
    @north = @south = @west = @east = nil
    self.setup
  end

  def setup
    @outline = Square.new(
      x: @col * SIZE, 
      y: @row * SIZE,
      size: SIZE + 1,
      color: 'green',
      z: 1
    )

    @tile = Square.new(
      x: (@col * SIZE) + 1, 
      y: (@row * SIZE) + 1,
      size: SIZE - 1,
      color: 'black',
      z: 3
    )
  end

  def select
    @outline.color = 'red'
    @outline.z = 2
  end

  def deselect
    @outline.color = 'green'
    @outline.z = 1
  end


end