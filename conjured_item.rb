require_relative 'inventory_item'

class ConjuredItem < InventoryItem
  def update
    @quality -= 1
    super
  end
end