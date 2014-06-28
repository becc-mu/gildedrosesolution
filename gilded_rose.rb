require_relative 'item'
require_relative 'item_factory'

class GildedRose
  attr_reader :items

  @items = []

  def initialize
    @items = []
    item_factory = ItemFactory.new
    @items << item_factory.create("+5 Dexterity Vest", 10, 20)
    @items << item_factory.create("Aged Brie", 2, 0)
    @items << item_factory.create("Elixir of the Mongoose", 5, 7)
    @items << item_factory.create("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << item_factory.create("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << item_factory.create("Conjured Mana Cake", 3, 6)
  end

  def update_quality
    @items.each do |item|
      if item.instance_of? Item
        item.quality -= 1 if (item.name.start_with?("Conjured") && item.quality > 2 )

        if (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert")
          if (item.quality > 0)
            if (item.name != "Sulfuras, Hand of Ragnaros")
              item.quality = item.quality - 1
            end
          end
        else
          if (item.quality < 50)
            item.quality = item.quality + 1
            if (item.name == "Backstage passes to a TAFKAL80ETC concert")
              if (item.sell_in < 11)
                if (item.quality < 50)
                  item.quality = item.quality + 1
                end
              end
              if (item.sell_in < 6)
                if (item.quality < 50)
                  item.quality = item.quality + 1
                end
              end
            end
          end
        end
        if (item.name != "Sulfuras, Hand of Ragnaros")
          item.sell_in = item.sell_in - 1;
        end
        if (item.sell_in < 0)
          if (item.name != "Aged Brie")
            if (item.name != "Backstage passes to a TAFKAL80ETC concert")
              if (item.quality > 0)
                if (item.name != "Sulfuras, Hand of Ragnaros")
                  item.quality = item.quality - 1
                end
              end
            else
              item.quality = item.quality - item.quality
            end
          else
            if (item.quality < 50)
              item.quality = item.quality + 1
            end
          end
        end
      else
        item.update
      end
    end # items.each
  end

end