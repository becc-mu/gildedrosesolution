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

    for i in 0..(@items.size-1)
      @items[i].quality -= 1 if (@items[i].name.start_with?("Conjured") && @items[i].quality > 2 )

      if (@items[i].name != "Aged Brie" && @items[i].name != "Backstage passes to a TAFKAL80ETC concert")
        if (@items[i].quality > 0)
          if (@items[i].name != "Sulfuras, Hand of Ragnaros")
            @items[i].quality = @items[i].quality - 1
          end
        end
      else
        if (@items[i].quality < 50)
          @items[i].quality = @items[i].quality + 1
          if (@items[i].name == "Backstage passes to a TAFKAL80ETC concert")
            if (@items[i].sell_in < 11)
              if (@items[i].quality < 50)
                @items[i].quality = @items[i].quality + 1
              end
            end
            if (@items[i].sell_in < 6)
              if (@items[i].quality < 50)
                @items[i].quality = @items[i].quality + 1
              end
            end
          end
        end
      end
      if (@items[i].name != "Sulfuras, Hand of Ragnaros")
        @items[i].sell_in = @items[i].sell_in - 1;
      end
      if (@items[i].sell_in < 0)
        if (@items[i].name != "Aged Brie")
          if (@items[i].name != "Backstage passes to a TAFKAL80ETC concert")
            if (@items[i].quality > 0)
              if (@items[i].name != "Sulfuras, Hand of Ragnaros")
                @items[i].quality = @items[i].quality - 1
              end
            end
          else
            @items[i].quality = @items[i].quality - @items[i].quality
          end
        else
          if (@items[i].quality < 50)
            @items[i].quality = @items[i].quality + 1
          end
        end
      end
    end
  end

end