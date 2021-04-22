class Cell
  attr_reader :alive
  def initialize
    @alive = false
  end

  def spawn
    @alive = true
  end

  def die
    @alive = false
  end

  def alive?
    alive
  end
end
