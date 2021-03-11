# frozen_string_literal: true

require_relative 'item'
#This class updates the quality and time until expiry of products
class GildedRose
  attr_reader :items

  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  def initialize(items)
    @items = items
  end

  def update_quality(items = @items)
    items.each do |item|
      options(item)
      item.sell_in -= 1 if item.sell_in > 0
    end
  end

  private
  def options(item)
    item.name == 'Aged Brie' ? increase_quality(item) :
      item.name.include?('Backstage pass') ? backstage_pass(item) :
         normal_protocol(item) if !item.name.include?('Sulfura')
  end

  def backstage_pass(item)
    item.sell_in > 10 ? increase_quality(item) :
      item.sell_in > 5 ? 2.times { increase_quality(item) } :
        item.sell_in > 0 ? 3.times { increase_quality(item) } : item.quality = 0
  end

  def normal_protocol(item)
    item.sell_in > 0 ? reduce_quality(item) : 2.times { reduce_quality(item) }
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
