class Inventory
  MAXIMUM_QUALITY = 50

  def max?(item)
    item.quality == MAXIMUM_QUALITY
  end
end
