require_relative 'item'
require_relative 'conjured_item'
require_relative 'sulfuras_item'
require_relative 'aged_brie_item'
require_relative 'backstage_passes_item'

class ItemFactory
  def create( name, sell_in, quality )
    if name.start_with? 'Conjured'
      ConjuredItem.new name, sell_in, quality
    elsif name.start_with? 'Sulfuras'
      SulfurasItem.new name, sell_in, quality
    elsif name.include? 'Aged Brie'
      AgedBrieItem.new name, sell_in, quality
    elsif name.include? "Backstage passes"
      BackstagePassesItem.new name, sell_in, quality
    else
      InventoryItem.new name, sell_in, quality
    end
  end
end