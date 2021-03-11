# frozen_string_literal: true

require_relative 'inventory'
# Updates stats of conjured items
class Conjured < Inventory
  def update(item)
    2.times { update_qual(item) }
    update_sell_in(item)
  end
end
