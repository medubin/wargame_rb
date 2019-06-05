require "ruby2d"
require_relative "board"
require_relative "./constants/terrain"

class Game
  def initialize(board_height, board_width, *players)
    self.draw_board(board_height, board_width)
    self.register_input
    @board = Board.new(board_height, board_width)
    @players = players
    Window.show
  end

  def draw_board(board_height, board_width)
    Window.set({
        title: "wargame",
        height: board_height * SIZE + 1,
        width: board_width * SIZE + 1
    })
  end

  def register_input
    Window.on :mouse_down do |event|
      self.select(event.x, event.y)
    end
  end
   

  def select x, y
    @board.select(y / SIZE, x / SIZE)
  end
  
  def turn

  end

  def win

  end

  def lose

  end


end

game = Game.new(32, 32, 'test')