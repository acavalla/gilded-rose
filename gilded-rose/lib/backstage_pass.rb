require_relative 'inventory'

class BackstagePass < Inventory
  def update(item)
    update_quality(item)
    update_sell_in(item)
  end

  def update_quality(item)
    case
    when item.sell_in > 10
      increase_qual(item)
    when item.sell_in > 5
      2.times { increase_qual(item) }
    when item.sell_in.positive?
      3.times { increase_qual(item) }
    else
      item.quality = 0
    end
  end
end
