# frozen_string_literal: true

class Board
  attr_reader :layout, :neighb_tally, :dims, :live

  DEF_DIMS = 2
  NEIGHB_LOC = [[-1, -1], [-1, 0], [-1, 1],
                [0, -1], [0, 1],
                [1, -1], [1, 0], [1, 1]].freeze

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
    live_cells
    live.each do |loc|
      label_neighbours(loc)
    end
  end

  private

  def label_neighbours(loc)
    NEIGHB_LOC.each do |nloc|
      add_one(loc[0] + nloc[0], loc[1] + nloc[1]) unless edge_cell(loc, nloc)
    end
  end

  def edge_cell(loc, nloc)
    (loc[0] + nloc[0]).negative? || (loc[1] + nloc[1]).negative? || loc[0] + nloc[0] > dims - 1 || loc[1] + nloc[1] > dims - 1
  end

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

  def live_cells
    @live = []
    layout.each_with_index.map do |row, row_index|
      row.each_with_index.map do |spot, spot_index|
        live << [row_index, spot_index] if spot == 1
      end
    end
  end

  def dead_or_alive(row_index, spot_index, spot)
    if alive_conditions(row_index, spot_index, spot)
      alive([row_index, spot_index])
    else
      dead([row_index, spot_index])
    end
  end

  def alive_conditions(row_index, spot_index, spot)
    neighb_tally[row_index][spot_index] == 3 ||
      (spot == 1 && neighb_tally[row_index][spot_index] == 2)
  end
end
