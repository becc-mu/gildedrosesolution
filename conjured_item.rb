require_relative 'inventory_item'

class ConjuredItem < InventoryItem
  def update_quality
    @quality -= 2
    puts @sell_in
    @quality -= 2 if @sell_in <= 0
  end
end