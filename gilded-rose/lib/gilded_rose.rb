# frozen_string_literal: true

require_relative 'item'
require_relative 'aged_brie'
require_relative 'backstage_pass'
require_relative 'conjured'

# This class stratifies items into classes to update their stats
class GildedRose
  attr_reader :items, :aged_brie, :backstage_pass, :conjured, :normal_item, :types

  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  def initialize(items)
    @items = items
    @normal_item = Inventory.new
    @aged_brie = AgedBrie.new
    @backstage_pass = BackstagePass.new
    @conjured = Conjured.new
    @types = { 'Aged Brie' => aged_brie,
               'Backstage pass' => backstage_pass,
               'Conjured' => conjured }
  end

  def update_quality(items = @items)
    items.each do |item|
      options(item) unless item.name.include?('Sulfura')
    end
  end

  private

  def options(item)
    if types.each_key.none? { |key| item_name_in_key?(item, key) }
      normal_item.update(item)
    else types.each_key do |key|
           types[key].update(item) if item_name_in_key?(item, key)
         end
    end
  end

  def item_name_in_key?(item, key)
    item.name.include?(key)
  end
end
