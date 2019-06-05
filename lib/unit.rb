require "ruby2d"

class Unit
  def initialize(terrain)
    @terrain = terrain
    self.setup
  end

  def setup
    @circle = Circle.new(
      x: @terrain.col * SIZE + (SIZE / 2.0) + 1,
      y: @terrain.row * SIZE + (SIZE / 2.0) + 1,
      radius: SIZE / 3,
      color: 'yellow',
      z: 5
    )
  end

  # selecting a unit should reveal the spaces it can move to

end