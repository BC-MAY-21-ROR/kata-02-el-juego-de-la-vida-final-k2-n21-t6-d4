# frozen_string_literal: true

# kata 02 Game of life iteration 3 units test
class GameOfLive
  def initialize(hei, wid)
    @height = hei
    @width = wid
    @init = Array.new(@height) { Array.new(@width) }
    @future = Array.new(@height) { Array.new(@width) }
  end

  def generate
    (0..(@height - 1)).each do |h|
      (0..(@width - 1)).each do |w|
        @future[h][w] = 0
        @init[h][w] = if [0, 1, 2].include?(rand(4))
                          0
                        else
                          1
                        end
      end
    end
  end
end
