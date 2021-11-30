# frozen_string_literal: true

# kata 02 Game of life iteration 3 units test
class GameOfLive
  def initialize(hei, wid)
    @height = hei
    @width = wid
    @init = Array.new(@height) { Array.new(@width) }
    @future = Array.new(@height) { Array.new(@width) }
  end
end
