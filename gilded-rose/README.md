======================================
# Gilded Rose

[specifications](https://github.com/makersacademy/course/blob/master/individual_challenges/gilded_rose.md)

This is my submission for the Gilded Rose tech test. You can see my planning in the planning markdown document. I started by listing all the issues I could initially see in the legacy code, however small, to remind me to come back to them if necessary. I diagrammed the domain by listing the classes and their attributes and methods, and diagrammed general inputs and outputs and conditions in a table. I then wrote a bit of pseudocode to get a feel for the overall structure of the update_quality method. I pulled out lots of bits of repeated code into small methods, eg to check min/max, to increase or reduce quality. I used `2.times { reduce_qual }` instead of `reduce_qual(-2)` to avoid an edge case of an item going from quality 1 to -1 and thereby 'skipping' fulfilling the `min?(item)` query.

However after doing that I realised I had one large class which did everything and one small class on which it was dependent. I drew a new table in the planning markdown and thought about how to make classes for types of items that would take care of updates, inheriting from the Inventory class which handled normal items' quality and sell-in behaviour (and made an extremely scribbly page of notes!). The more specialised classes also inherited the max and min checks and methods to increase or reduce quality by 1, checking against the max and min every time. I had never used inheritance before so it was fun to try it out.

Unfortunately doing this lost me the ability to generalise items: I previously used `.include` to look for any item including "Backstage pass" or "Conjured". However, because this time I was matching from a hash, I matched directly. It probably is fixable, probably using cases, but currently my brain is fried and I think I'd rather get feedback first!

Overall I enjoyed this test. It was interesting to read and improve legacy code, and fun to write the tests, then break them and fix them one by one! For ease of testing, I allowed update_quality to take an argument, with `@items` as the default.

Please see below for an irb extract. To run the test suite, please clone this repo, run `bundle` and then `rspec`.

```irb
2.7.2 :001 > items =items = [Item.new('foo', 1, 3),
2.7.2 :002 >   Item.new('Sulfuras, Hand of Ragnaros', 2, 80),
2.7.2 :003 >   Item.new('Aged Brie', 2, 49),
2.7.2 :004 >   Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0),

2.7.2 :005 >            Item.new('Conjured Hand', 4, 6)]
 => [#<Item:0x00007fb6e198cd18 @name="foo", @sell_in=1, @quality=3>, #<Item:0x00007fb6e198ccc8 ...
2.7.2 :006 > gr = GildedRose.new(items)
 => #<GildedRose:0x00007fb6e19ac938 @items=[#<Item:0x00007fb6e198cd18 @name="foo", @sell_in=1, ...
2.7.2 :007 > gr
 => #<GildedRose:0x00007fb6e19ac938 @items=[
 #<Item:0x00007fb6e198cd18 @name="foo", @sell_in=1, @quality=3>,
#<Item:0x00007fb6e198ccc8 @name="Sulfuras, Hand of Ragnaros", @sell_in=2, @quality=80>,
#<Item:0x00007fb6e198cc78 @name="Aged Brie", @sell_in=2, @quality=49>,
#<Item:0x00007fb6e198cc28 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=11, @quality=0>,
#<Item:0x00007fb6e198cbd8 @name="Conjured Hand", @sell_in=4, @quality=6>],
@normal_item=#<Inventory:0x00007fb6e19ac910>
@aged_brie=#<AgedBrie:0x00007fb6e19ac8e8>,
@backstage_pass=#<BackstagePass:0x00007fb6e19ac8c0>,
@conjured=#<Conjured:0x00007fb6e19ac898>,
@types={"AgedBrie"=>#<AgedBrie:0x00007fb6e19ac8e8>,
"Backstage passes to a TAFKAL80ETC concert"=>#<BackstagePass:0x00007fb6e19ac8c0>,
"Conjured Hand"=>#<Conjured:0x00007fb6e19ac898>}>
2.7.2 :008 > gr.update_quality
 => [#<Item:0x00007fb6e198cd18 @name="foo", @sell_in=0, @quality=2>,
 #<Item:0x00007fb6e198ccc8 @name="Sulfuras, Hand of Ragnaros", @sell_in=2, @quality=80>, 
#<Item:0x00007fb6e198cc78 @name="Aged Brie", @sell_in=1, @quality=50>,
#<Item:0x00007fb6e198cc28 @name="Backstage passes to a TAFKAL80ETC concert", @sell_in=10, @quality=1>,
#<Item:0x00007fb6e198cbd8 @name="Conjured Hand", @sell_in=3, @quality=4>]
```
