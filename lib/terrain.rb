require "ruby2d"
require_relative "./constants/terrain"

class Terrain
    attr_accessor :north, :south, :west, :east
  def initialize(y, x)
    @y = y
    @x = x
    @unit = nil
    @north = @south = @west = @east = nil
    self.setup
  end

  def setup
    @outline = Square.new(
      x: @x * SIZE, 
      y: @y * SIZE,
      size: SIZE + 1,
      color: 'green',
      z: 1
    )

    @tile = Square.new(
      x: (@x * SIZE) + 1, 
      y: (@y * SIZE) + 1,
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