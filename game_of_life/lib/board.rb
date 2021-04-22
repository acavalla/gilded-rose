class Board
  attr_reader :layout
  def initialize(columns = 2, rows = 2)
    @layout = [Array.new(columns, 0)] * rows
  end
end
