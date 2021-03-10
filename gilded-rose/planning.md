## Planning

Issues with the initial state of the gilded rose code
 - Only one test in the test suite
 - Test does not pass
 - update_quality method is like a million lines long
 - update_quality method has an empty arguments list
 - Both classes in same file
 - I don't initially see any use of the to_s method in the items class

Class: Item
Attrs: name (String)
       sell_in (integer, can be +ve or -ve)
       quality (changes daily depending on: type of item, sell_in. min: 0, max: 50)
Methods: initialize, to_s

Class: Gilded_rose
Attrs: items
Methods: initialize, update_quality



| Item | Situation | Quality | sell_in |
|------|-----------|-----|---|
| Normal | sell_in >= 0 | Decreases daily by 1 | Decreases daily by 1 |
| Normal | sell_in < 0 | Decreases daily by 2 | Decreases daily by 1 |
| Sulfura | -- | 80 | -- |
| Aged Brie | All | Increases daily by 1 | -- |
| Backstage passes | sell_in < 10 | Increases daily by 1 | Decreases daily by 1 |
| Backstage passes | sell_in =< 10 | Increases daily by 2 | Decreases daily by 1 |
| Backstage passes | sell_in =< 5 | Increases daily by 3 | Decreases daily by 1 |
| Backstage passes | sell_in = 0 | 0 | 0 |
| Conjured items | All | Decreases daily by 2 | Decreases daily by 1 |



pseudocode
quality = Case: name
            =~ sulfura?
              80 # can set at beginning and never change
            == brie?
              brie
            =~ backstage pass?
              backstage_pass
            =~ conjured?
              conjured
            == else
              normal
          end


def brie
  if < 50
    quality += 1
  end
end

def backstage_pass
etc
end
--> Always check with min/max before changing anything
