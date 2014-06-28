require_relative 'item'

class ItemFactory
  def create( name, sell_in, quality )
    Item.new name, sell_in, quality
  end
end