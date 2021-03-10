require_relative "item"

class GildedRose
  attr_reader :items
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0
  def initialize(items)
    @items = items
  end

  def update_quality(items = @items)
    items.each do |item|
      case item.name
      when "Sulfuras, Hand of Ragnaros"
      when "Aged Brie"
        increase_quality(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        backstage_pass(item)
      else
        normal_protocol(item)
      end
    item.sell_in -= 1 if item.sell_in > 0
    end
  end

  private

  def backstage_pass(item)
    case
    when item.sell_in > 10
      increase_quality(item)
    when item.sell_in > 5
      2.times { increase_quality(item) }
    when item.sell_in > 0
      3.times { increase_quality(item) }
    when item.sell_in = 0
      item.quality = 0
    end
  end

  def normal_protocol(item)
    if item.sell_in > 0
      reduce_quality(item)
    else
      2.times { reduce_quality(item) }
    end
  end

  def max?(item)
    item.quality == MAXIMUM_QUALITY
  end

  def min?(item)
    item.quality == MINIMUM_QUALITY
  end

  def reduce_quality(item)
    item.quality -= 1 unless min?(item)
  end

  def increase_quality(item)
    item.quality += 1 unless max?(item)
  end
end
