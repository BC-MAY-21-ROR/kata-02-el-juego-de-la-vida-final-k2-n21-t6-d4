require 'rspec'
require_relative 'game_of_life'

describe GameOfLive do
  it '5  and 6' do
    grid = GameOfLive.new(5, 6)
    expect(grid.next_generation)
  end
  it '7 and 9' do
    grid = GameOfLive.new(7, 9)
    expect(grid.next_generation)
  end
end