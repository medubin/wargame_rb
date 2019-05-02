require 'ruby2d'
require_relative 'constants/board'
require_relative 'board'
require_relative 'unit'

set title: "Wargame"
set width: PIXEL_WIDTH, height: PIXEL_HEIGHT



board = Board.new(WIDTH, HEIGHT)
board.display

unit = Unit.new(board.field[19][19])
unit.display

@x_speed = 0
@y_speed = 0
on :key_down do |event|
  if event.key == 'w'
    board.move_unit(unit, 0, -1)
  elsif event.key == 'a'
    board.move_unit(unit, -1, 0)
  elsif event.key == 's'
    board.move_unit(unit, 0, 1)
  elsif event.key == 'd'
    board.move_unit(unit, 1, 0)
  end
end

update do
end



show