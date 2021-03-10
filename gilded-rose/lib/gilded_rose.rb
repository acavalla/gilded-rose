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
        if item.sell_in > 0
          reduce_quality(item)
        else
          2.times { reduce_quality(item) }
        end
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

  def max?(item)
    item.quality < MAXIMUM_QUALITY
  end

  def min?(item)
    item.quality > MINIMUM_QUALITY
  end

  def reduce_quality(item)
    item.quality -= 1 if min?(item)
  end

  def increase_quality(item)
    item.quality += 1 if max?(item)
  end

  # def update_quality
  #   @items.each do |item|
  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       if item.quality > 0
  #         if item.name != "Sulfuras, Hand of Ragnaros"
  #           item.quality = item.quality - 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
