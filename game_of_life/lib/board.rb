# frozen_string_literal: true

class Board
  attr_reader :layout, :neighbs, :dims

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
    @neighbs = new_array(dims)
    layout.each_with_index.map do |row, row_index|
      row.each_with_index.map do |spot, spot_index|
        add_to_neighbours(row_index, spot_index) if spot == 1
      end
    end
  end

  private

  def add_to_neighbours(row_index, spot_index)
    add_one_above(row_index, spot_index)
    add_one_left(row_index, spot_index)
    add_one_below(row_index, spot_index)
    add_one_right(row_index, spot_index)
  end

  def new_array(dims)
    Array.new(dims) { Array.new(dims, 0) }
  end

  def add_one_above(row_index, spot_index)
    add_one(row_index - 1, spot_index) if row_index.positive?
  end

  def add_one_left(row_index, spot_index)
    add_one(row_index, spot_index - 1) if spot_index.positive?
  end

  def add_one_below(row_index, spot_index)
    add_one(row_index + 1, spot_index) if row_index < layout.length - 1
  end

  def add_one_right(row_index, spot_index)
    add_one(row_index, spot_index + 1) if spot_index < layout.length - 1
  end

  def add_one(row_index, spot_index)
    @neighbs[row_index][spot_index] += 1
  end

  def new_layout
    layout.each_with_index.map do |row, row_index|
      row.each_with_index.map do |spot, spot_index|
        dead_or_alive(row_index, spot_index, spot)
      end
    end
  end

  def dead_or_alive(row_index, spot_index, spot)
    if neighbs[row_index][spot_index] == 3
      alive([row_index, spot_index])
    elsif spot == 1 && neighbs[row_index][spot_index] == 2
      alive([row_index, spot_index])
    else
      dead([row_index, spot_index])
    end
  end
end
