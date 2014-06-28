require_relative 'item'
require_relative 'conjured_item'

class ItemFactory
  def create( name, sell_in, quality )
    if name.start_with? 'Conjured'
      ConjuredItem.new name, sell_in, quality
    elsif name.start_with? 'Sulfuras'
      SulfurasItem.new name, sell_in, quality
    elsif name.include? 'Aged Brie'
      AgedBrieItem.new name, sell_in, quality
    else
      Item.new name, sell_in, quality
    end
  end
end