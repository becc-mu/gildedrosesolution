require_relative 'item'

class InventoryItem < Item
  def update
    update_sell_in
    update_quality
  end

  protected
  def update_quality
    if @sell_in > 0
      @quality -= 1
    else
      @quality -= 2
    end

    @quality = 0 if @quality < 0
  end

  def update_sell_in
    @sell_in -= 1
  end

end