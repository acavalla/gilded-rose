======================================
# Gilded Rose

[specifications]("https://github.com/makersacademy/course/blob/master/individual_challenges/gilded_rose.md")

This is my submission for the Gilded Rose tech test. You can see my planning in the planning markdown document. I started by listing all the issues I could initially see in the legacy code, however small, to remind me to come back to them if necessary. I diagrammed the domain by listing the classes and their attributes and methods, and diagrammed general inputs and outputs and conditions in a table. I then wrote a bit of pseudocode to get a feel for the overall structure of the update_quality method. I pulled out lots of bits of repeated code into small methods, eg to check min/max, to increase or reduce quality. I used `2.times { reduce_qual }` instead of `reduce_qual(-2)` to avoid an edge case of an item going from quality 1 to -1 and thereby 'skipping' fulfilling the `min?(item)` query.

I also changed the name queries to use the 'include' method to allow easier adding of further backstage passes or sulfura (I have no idea what this is, I have never played DnD but it seemed that sulfura was the category and Sulfuras: Foot of Ragnaros or whatever was the specific instance). After writing all these little methods it took me about 60 seconds to add the conjured category in to pass its tests (although obviously as the author I am biased).

Overall I enjoyed this test. It was interesting to read and improve legacy code, and fun to write the tests, then break them and fix them one by one! For ease of testing, I allowed update_quality to take an argument, with `@items` as the default.

Please see below for an irb extract. To run the test suite, please clone this repo, run `bundle` and then `rspec`.

```irb
2.7.2 :001 > items = [Item.new('foo', 1, 3),
2.7.2 :002 > Item.new('Sulfuras, Hand of Ragnaros', 2, 80),
2.7.2 :003 > Item.new('Aged Brie', 2, 49),
2.7.2 :004 > Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0),
2.7.2 :005 > Item.new('Conjured Hand', 4, 6)]
2.7.2 :006 > gilded_rose = GildedRose.new(items)
#<GildedRose:0x00007faef003b8e8 @items=[
#<Item:0x00007faef0196e40 @name="foo", @sell_in=0, @quality=2>,
#<Item:0x00007faef0196df0 @name="Sulfuras, Hand of Ragnaros", @sell_in=1, @quality=80>,
#<Item:0x00007faef0196da0 @name="Aged Brie", @sell_in=1, @quality=50>,
#<Item:0x00007faef0196d50 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=10, @quality=1>,
#<Item:0x00007faef0196d51 @name="Conjured Hand", @sell_in=4, @quality=6>]>
2.7.2 :006 > gilded_rose.update_quality
 => [#<Item:0x00007faef0196e40 @name="foo", @sell_in=0, @quality=2>,
 #<Item:0x00007faef0196df0 @name="Sulfuras, Hand of Ragnaros", @sell_in=1, @quality=80>,
 #<Item:0x00007faef0196da0 @name="Aged Brie", @sell_in=1, @quality=50>,
 #<Item:0x00007faef0196d50 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=10, @quality=1>,
 #<Item:0x00007faef0196d51 @name="Conjured Hand", @sell_in=3, @quality=4>]>]
```
