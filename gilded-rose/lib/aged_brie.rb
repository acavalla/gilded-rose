require_relative 'inventory'

class AgedBrie < Inventory

  def update(item)
    item.quality += 1 unless max?(item)
  end

end
