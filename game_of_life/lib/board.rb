class Board
  attr_reader :layout, :neighbs
  DEF_DIMS = 2
  def initialize
    @layout = new_array
  end

  def alive(location)
    @layout[location[0]][location[1]] = 1
  end

  def dead(location)
    @layout[location[0]][location[1]] = 0
  end

  def tick
    neighbours
    layout.each_with_index.map do |row, row_index|
      row.each_with_index.map do |spot, spot_index|
        if neighbs[row_index][spot_index] == 3
          alive([row_index, spot_index])
        elsif spot == 1 && neighbs[row_index][spot_index] == 2
          alive([row_index, spot_index])
        else
          dead([row_index, spot_index])
        end
      end
    end
  end

  def neighbours
    @neighbs = new_array
    layout.each_with_index.map do |row, row_index|
      row.each_with_index.map do |spot, spot_index|
        if spot == 1
          add_one_above(row_index, spot_index)
          add_one_left(row_index, spot_index)
          add_one_below(row_index, spot_index)
          add_one_right(row_index, spot_index)
        end
      end
    end
  end

  private

  def new_array(dims = DEF_DIMS)
    Array.new(dims) { Array.new(dims, 0) }
  end

  def add_one_above(row_index, spot_index)
    if row_index > 0
      add_one(row_index-1, spot_index)
    end
  end

  def add_one_left(row_index, spot_index)
    if spot_index > 0
      add_one(row_index, spot_index-1)
    end
  end

  def add_one_below(row_index, spot_index)
    if row_index < layout.length-1
      add_one(row_index+1, spot_index)
    end
  end

  def add_one_right(row_index, spot_index)
    if spot_index < layout.length-1
      add_one(row_index, spot_index+1)
    end
  end

  def add_one(row_index, spot_index)
    @neighbs[row_index][spot_index] += 1
  end
end
