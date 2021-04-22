class Board
  attr_reader :columns, :rows
  def initialize(columns = 2, rows = 2)
    @columns = columns
    @rows = rows
  end

  def layout
    [Array.new(columns, 0)] * rows
  end
end
