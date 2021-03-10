# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'

describe GildedRose do
items = [Item.new("foo", 1, 2),
         Item.new("Sulfuras, Hand of Ragnaros", 2, 80),
         Item.new("Aged Brie", 2, 49)]

  describe "#update_quality" do
    before :all do
      GildedRose.new(items).update_quality
    end

    context "normal items" do
      it "alters quality and sell_in of normal items down by one" do
        expect(items[0].quality).to eq 1
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
      it "increases quality daily" do
        expect(items[2].quality).to eq 50
      end
    end



  end

end
