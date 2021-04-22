# frozen_string_literal: true

class Board
  attr_reader :layout, :neighb_tally, :dims

  DEF_DIMS = 2
  def initialize(dims = DEF_DIMS)
    @dims = dims
    @layout = new_array(dims)
  end

  def alive(location)
    @layout[location[0]][location[1]] = 1
  end

  def dead(location)
    @layout[location[0]][location[1]] = 0
  end

  def tick
    neighbours
    new_layout
  end

  def neighbours
    @neighb_tally = new_array(dims)
    neighb_loc = [[-1,-1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    layout.each_with_index.map do |row, row_index|
      row.each_with_index.map do |spot, spot_index|
        if spot == 1
        neighb_loc.each do |loc|
          unless row_index+loc[0] < 0 || spot_index+loc[1] < 0 || row_index+loc[0] > dims-1 || spot_index+loc[1] > dims-1
            add_one(row_index+loc[0], spot_index+loc[1])
          end
        end
      end
      end
    end
  end

  private

  def new_array(dims)
    Array.new(dims) { Array.new(dims, 0) }
  end

  def add_one(row_index, spot_index)
    @neighb_tally[row_index][spot_index] += 1
  end

  def new_layout
    layout.each_with_index.map do |row, row_index|
      row.each_with_index.map do |spot, spot_index|
        dead_or_alive(row_index, spot_index, spot)
      end
    end
  end

  def dead_or_alive(row_index, spot_index, spot)
    if neighb_tally[row_index][spot_index] == 3
      alive([row_index, spot_index])
    elsif spot == 1 && neighb_tally[row_index][spot_index] == 2
      alive([row_index, spot_index])
    else
      dead([row_index, spot_index])
    end
  end
end
