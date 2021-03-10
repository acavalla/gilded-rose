# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'

describe GildedRose do
items = [Item.new("foo", 1, 1),
         Item.new("Sulfuras, Hand of Ragnaros", 2, 80),
         Item.new("Aged Brie", 2, 49),
         Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 0)]
gilded_rose = GildedRose.new(items)

  describe "#update_quality" do
    before :all do
      gilded_rose.update_quality
    end

    context "normal items" do
      it "alters quality and sell_in of normal items down by one" do
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq 0
        gilded_rose.update_quality([items[0]])
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq 0
      end

      it "does not change the name" do
        expect(items[0].name).not_to eq "fixme"
      end
    end

    context "Sulfura" do
      it "keeps quality of sulfura at 80" do
        expect(items[1].quality).to eq 80
      end
    end

    context "Aged Brie" do
      it "increases quality daily up to a max of 50" do
        expect(items[2].quality).to eq 50
        gilded_rose.update_quality([items[2]])
        expect(items[2].quality).to eq 50
      end
    end

    context "Backstage passes" do
      it "quality +1 daily over 10 days" do
        expect(items[3].quality).to eq 1
      end

      it "decreases sell_in" do
        expect(items[3].sell_in).to eq 10
      end

      it "quality +2 daily between 10-5 days" do
        gilded_rose.update_quality([items[3]])
        expect(items[3].quality).to eq 3
      end

      it "quality +3 between 5-1 days" do
        5.times { gilded_rose.update_quality([items[3]]) }
        expect(items[3].sell_in).to eq 4
        expect(items[3].quality).to eq 14
      end

      it "quality 0 when sell_in is 0" do
        5.times { gilded_rose.update_quality([items[3]]) }
        expect(items[3].quality).to eq 0
      end

    end



  end

end
