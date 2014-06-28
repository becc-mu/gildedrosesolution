require_relative 'inventory_item'

class SulfurasItem < InventoryItem
  def update
    super
    @quality += 1
    @sell_in += 1
  end
end