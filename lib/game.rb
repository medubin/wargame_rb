require 'ruby2d'
require_relative 'constants/board'
require_relative 'board'
require_relative 'unit'

set title: "Wargame"
set width: PIXEL_WIDTH, height: PIXEL_HEIGHT



board = Board.new(WIDTH, HEIGHT)
board.display

unit = Unit.new()
board.place_unit(19, 19, unit)

on :key_down do |event|
  if event.key == 'w'
    board.move_unit(unit.x, unit.y, 0, -1)
  elsif event.key == 'a'
    board.move_unit(unit.x, unit.y, -1, 0)
  elsif event.key == 's'
    board.move_unit(unit.x, unit.y, 0, 1)
  elsif event.key == 'd'
    board.move_unit(unit.x, unit.y, 1, 0)
  end
end

on :mouse_down do |event|
  target_x = event.x / TILE_WIDTH
  target_y = event.y / TILE_HEIGHT
  board.select_tile(target_x, target_y)

end

update do
end



show