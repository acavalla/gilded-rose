# frozen_string_literal: true

# Can I remove the board from this? Just have live cells and their locations
# and dead cells which are non_alive cells?
class Board
  attr_reader :dims, :live, :neighb_tally_locs


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
    new_layout
  end

  def neighbours
    @neighb_tally = new_array(dims)
    @neighb_tally_locs = []
    live.each do |loc|
      label_neighbours(loc)
    end
  end

  private

  def label_neighbours(loc)
    NEIGHB_LOC.each do |nloc|
      current_spot = [loc[0]+nloc[0], loc[1] + nloc[1]]
      if @neighb_tally_locs.any? {|h| h[:location] == current_spot}
        @neighb_tally_locs.select{|key, value| key[:location] == current_spot}[0][:tally] += 1
      else
        @neighb_tally_locs << {:location => current_spot,
                              :tally => 1,
                              :status => live.include?([loc[0]+nloc[0], loc[1] + nloc[1]]) ? 1 : 0}
      end
    end
  end

  def new_array(dims)
    Array.new(dims) { Array.new(dims, 0) }
  end

  def new_layout
    @live = []
    @neighb_tally_locs.select{|key, value| key[:tally] == 3 }.each { |key| live << key[:location]}
    @neighb_tally_locs.select{|key, value| key[:tally] == 2 && key[:status] == 1 }.each { |key| live << key[:location]}
  end
end
