# frozen_string_literal: true

require_relative 'inventory'
# Updates stats of backstage passes
class BackstagePass < Inventory
  def update(item)
    update_quality(item)
    update_sell_in(item)
  end

  def update_quality(item)
    if item.sell_in > 10
      increase_qual(item)
    elsif item.sell_in > 5
      2.times { increase_qual(item) }
    elsif item.sell_in.positive?
      3.times { increase_qual(item) }
    else
      item.quality = 0
    end
  end
end
