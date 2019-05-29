require "ruby2d"
require_relative "terrain"

class Board
    attr_reader :height, :width

  def initialize(height, width)
    @height = height
    @width = width
    @grid = Array.new(height) { |row| Array.new(width) { |col| Terrain.new(row, col) } }
    self.graph_grid
  end

  def graph_grid
    @grid.each_index do |row|
      @grid[row].each_with_index do |terrain, col|
        terrain.north = @grid[row - 1][col] if row - 1 >= 0
        terrain.south = @grid[row + 1][col] if row + 1 <= (@height - 1)
        terrain.west = @grid[row][col - 1] if col - 1 >= 0
        terrain.east = @grid[row][col + 1] if col + 1 <= (@width - 1)
      end
    end
  end

  def select row, col
    @grid[row][col].select
  end

end