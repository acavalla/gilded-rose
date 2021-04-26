# frozen_string_literal: true

# Keeps track of and updates live cells

class Board
  attr_reader :dims, :live, :neighb_tally

  DEF_DIMS = 2
  NEIGHB_LOC = [[-1, -1], [-1, 0], [-1, 1],
                [0, -1], [0, 1],
                [1, -1], [1, 0], [1, 1]].freeze

  def initialize(dims = DEF_DIMS)
    @dims = dims
    @live = []
  end

  def alive(location)
    live << [location[0], location[1]]
  end

  def dead(location)
    live.delete([location[0], location[1]])
  end

  def tick
    neighbours
    update_live
  end

  def neighbours
    @neighb_tally = []
    live.each do |loc|
      label_neighbours(loc)
    end
  end

  private

  def label_neighbours(loc)
    NEIGHB_LOC.each do |nloc|
      current_spot = [loc[0] + nloc[0], loc[1] + nloc[1]]
      if neighb_tally.any? { |h| h[:location] == current_spot }
        increase_tally(current_spot)
      else
        neighb_tally << { location: current_spot,
                                tally: 1,
                                status: live.include?(current_spot) ? 1 : 0 }
      end
    end
  end

  def increase_tally(current_spot)
    neighb_tally.select { |key| key[:location] == current_spot }[0][:tally] += 1
  end

  def update_live
    @live = []
    neighb_tally.select { |key, _value| key[:tally] == 3 }.each { |key| live << key[:location] }
    neighb_tally.select { |key, _value| key[:tally] == 2 && key[:status] == 1 }.each { |key| live << key[:location] }
  end
end
