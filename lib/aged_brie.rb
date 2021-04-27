# frozen_string_literal: true

require_relative 'inventory'
# Updates stats of aged brie
class AgedBrie < Inventory
  def update(item)
    increase_qual(item)
    update_sell_in(item)
  end
end
