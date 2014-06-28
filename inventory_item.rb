require_relative 'item'

class InventoryItem < Item
  def update
    @quality -= 1
    @sell_in -= 1
  end


end