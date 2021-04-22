class Board
  attr_reader :layout, :neighbs
  def initialize(dims = 2)
    @layout = Array.new(dims) { Array.new(dims, 0) }
  end

  def alive(location)
    @layout[location[0]][location[1]] = 1
  end

  def dead(location)
    @layout[location[0]][location[1]] = 0
  end

  def tick
    layout
  end

  def neighbours
    @neighbs = Array.new(2) { Array.new(2, 0) }
    layout.each_with_index.map do |row, row_index|
      row.each_with_index.map do |spot, spot_index|
        if spot == 1
          if row_index > 0
            @neighbs[row_index-1][spot_index] += 1
          end
          if spot_index > 0
            @neighbs[row_index][spot_index-1] += 1
          end
          if row_index < layout.length-1
            @neighbs[row_index+1][spot_index] += 1
          end
          if spot_index < layout.length-1
            puts @neighbs
            @neighbs[row_index][spot_index+1] += 1
          end
        end
      end
    end
  end
end
