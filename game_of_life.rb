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

  def print_matriz(matriz)
    (0..(@height - 1)).each do |h|
      (0..(@width - 1)).each do |w|
        if matriz[h][w].zero?
          print '.'
        else
          print '*'
        end
      end
      puts
    end
  end

  def next_generation
    generate
    print "\n\n"
    print_matriz(@init)
    print "\n\n"
    (0..@height - 1).each do |h|
      (0..@width - 1).each do |w|
        cells_rules(h, w, neighbors(h, w))
      end
    end
    print_matriz(@future)
  end

  def neighbors(hei, wid)
    cells_around = 0
    (-1..1).each do |h| # height y/a
      (-1..1).each do |w| # width x/b
        a = hei + h
        b = wid + w
        cells_around += @init[a][b] if a >= 0 && b >= 0 && a < @height && b < @width
      end
    end
    cells_around -= @init[hei][wid]
  end

  def cells_rules(hei, wid, neighbors)
    @future[hei][wid ] = if @init[hei][wid] == 1 && neighbors < 2
                           0
                         elsif @init[hei][wid] == 1 && neighbors > 3
                           0
                         elsif @init[hei][wid].zero? && neighbors == 3
                           1
                         else
                           @init[hei][wid]
                         end
  end
end

puts "Chose your height: "
userHeight = gets
puts "Choose your width: "
userWidth = gets

newGame = GameOfLive.new(userHeight.to_i,userWidth.to_i)

newGame.next_generation
