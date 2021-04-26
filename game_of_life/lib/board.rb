# frozen_string_literal: true

# Keeps track of and updates live cells

class Board
  attr_reader :dims, :live, :neighb_tally

  DEF_DIMS = 2
  NEIGHBOURS = [[-1, -1], [-1, 0], [-1, 1],
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
    count_neighbours
    update_live
  end

  def count_neighbours
    @neighb_tally = []
    live.each do |loc|
      label_neighbours(loc)
    end
  end

  private

  def label_neighbours(loc)
    NEIGHBOURS.each do |nloc|
      current_spot = [loc[0] + nloc[0], loc[1] + nloc[1]]
      if in_hash?(current_spot)
        increase_count(current_spot)
      else
        add_to_hash(current_spot)
      end
    end
  end

  def in_hash?(current_spot)
    neighb_tally.any? { |h| h[:location] == current_spot }
  end

  def increase_count(current_spot)
    neighb_tally.select { |key| key[:location] == current_spot }[0][:tally] += 1
  end

  def add_to_hash(current_spot)
    neighb_tally << { location: current_spot,
                            tally: 1,
                            status: live.include?(current_spot) ? 1 : 0 }
  end

  def update_live
    @live = []
    neighb_tally.select { |hash| three(hash) }.each { |hash| alive(hash) }
    neighb_tally.select { |hash| two_alive(hash) }.each { |hash| alive(hash) }
  end

  def three(hash)
    hash[:tally] == 3
  end

  def two_alive(hash)
    hash[:tally] == 2 && hash[:status] == 1
  end
end
