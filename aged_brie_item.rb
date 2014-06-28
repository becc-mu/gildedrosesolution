require_relative 'inventory_item'

class AgedBrieItem < InventoryItem
  def update_quality
    @quality += 1 if @quality < 50
  end
end