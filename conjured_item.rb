require_relative 'inventory_item'

class ConjuredItem < InventoryItem
  def update_quality
    @quality -= 2
  end
end