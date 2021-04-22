class Board
  attr_reader :layout
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
end
