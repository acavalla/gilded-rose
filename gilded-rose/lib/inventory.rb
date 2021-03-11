class Inventory
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0

  def max?(item)
    item.quality == MAXIMUM_QUALITY
  end

  def min?(item)
    item.quality == MINIMUM_QUALITY
  end

  def normal_protocol(item)
    item.sell_in.positive? ? reduce_qual(item) : 2.times { reduce_qual(item) }
  end

  def reduce_qual(item)
    item.quality -= 1 unless min?(item)
  end
end
