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
    live << location
  end

  def dead(location)
    live.delete(location)
  end

  def tick
    count_neighbours
    update_live
  end

  private

  def count_neighbours
    @neighb_tally = []
    live.each do |loc|
      label_neighbours(loc)
    end
  end

  def label_neighbours(loc)
    NEIGHBOURS.each do |nloc|
      spot = [loc[0] + nloc[0], loc[1] + nloc[1]]
      in_hash?(spot) ? increase_count(spot) : add_to_hash(spot)
    end
  end

  def in_hash?(spot)
    neighb_tally.any? { |h| h[:location] == spot }
  end

  def increase_count(spot)
    neighb_tally.select { |key| key[:location] == spot }[0][:tally] += 1
  end

  def add_to_hash(spot)
    neighb_tally << { location: spot,
                      tally: 1,
                      status: live.include?(spot) ? 1 : 0 }
  end

  def update_live
    @live = []
    @neighb_tally = neighb_tally.select { |hash| living_conditions(hash) }
    neighb_tally.each { |hash| alive(hash[:location]) }
  end

  def living_conditions(hash)
    hash[:tally] == 3 || (hash[:tally] == 2 && hash[:status] == 1)
  end
end
