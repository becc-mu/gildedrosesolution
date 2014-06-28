require_relative 'inventory_item'

class BackstagePassesItem < InventoryItem
  def update_quality
    if @sell_in > 10
      @quality += 1
    elsif @sell_in > 5
      @quality += 2
    elsif @sell_in > 0
      @quality += 3
    else
      @quality = 0
    end
  end
end