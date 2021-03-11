require_relative 'inventory'

class AgedBrie < Inventory
  def update(item)
    increase_qual(item)
    update_sell_in(item)
  end
end