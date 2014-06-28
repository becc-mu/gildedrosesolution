require_relative 'inventory_item'
class ConjuredItem < InventoryItem
  def update_quality
    @quality -= 1
    super
  end
end