require_relative 'inventory'

class Conjured < Inventory
  def update(item)
    2.times { reduce_qual(item) }
    update_sell_in(item)
  end
end
