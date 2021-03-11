# frozen_string_literal: true

require_relative 'gilded_rose'
require_relative 'item'

items = [Item.new('foo', 1, 3),
         Item.new('Sulfuras, Hand of Ragnaros', 2, 80),
         Item.new('Aged Brie', 2, 49),
         Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0),
         Item.new('Conjured Hand', 4, 6)]
gr = GildedRose.new(items)
gr.update_quality
