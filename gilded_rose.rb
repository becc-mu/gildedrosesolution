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
      item.update
    end
  end

end