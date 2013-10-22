class SeasonsController < ApplicationController

  def three_pointers
    @threes_attempted_per_game = Season.all.map(&:threes_attempted_per_game)
  end

end