require_relative 'item'

class InventoryItem < Item
  def update
    update_sell_in
    update_quality
  end

  protected
  def update_quality
    @quality -= 1
  end

  def update_sell_in
    @sell_in -= 1
  end

end