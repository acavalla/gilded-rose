# frozen_string_literal: true

# Updates stats of regular items
class Inventory
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0

  def max?(item)
    item.quality == MAXIMUM_QUALITY
  end

  def min?(item)
    item.quality == MINIMUM_QUALITY
  end

  def update(item)
    update_qual(item)
    update_sell_in(item)
  end

  def update_qual(item)
    item.sell_in.positive? ? reduce_qual(item) : 2.times { reduce_qual(item) }
  end

  def update_sell_in(item)
    item.sell_in -= 1 if item.sell_in.positive?
  end

  def reduce_qual(item)
    item.quality -= 1 unless min?(item)
  end

  def increase_qual(item)
    item.quality += 1 unless max?(item)
  end
end
