require_relative '../gilded_rose'
require_relative '../item_factory'
require_relative '../inventory_item'
require_relative '../conjured_item'
require_relative '../sulfuras_item'
require_relative '../aged_brie_item'
require_relative '../backstage_passes_item'


describe 'GildedRose' do
	subject { GildedRose.new }

	it { should respond_to(:update_quality) }
  it { should respond_to(:items) }

  it "should not have any items that are an instance of Item" do
    subject.items.each do |item|
          expect(item).to_not be_an_instance_of(Item)
    end
  end

end

describe 'Item' do
  subject { Item.new :foo, :bar, :baz }

  it { should respond_to(:name) }
  it { should respond_to(:sell_in) }
  it { should respond_to(:quality) }

end

describe "InventoryItem" do
  subject { InventoryItem.new "+5 Dexterity Vest", 10, 20 }

  context "base item behavior" do

    it "should decrease sell_in by 1" do
      expect {
        subject.update
      }.to change{ subject.sell_in }.by(-1)
    end

    it "should decrease quality by 1" do
      expect {
        subject.update
      }.to change{ subject.quality }.by(-1)
    end

    it "should always have a non-negative quality" do
      expect {
        (subject.sell_in * 10).times {subject.update}
      }.to change{ subject.quality }.to(0)
    end

    context "when sell_in expires" do
      before(:each) { 10.times{ subject.update } }

      it "should have a sell_in < 1" do
        expect(subject.sell_in).to be < 1
      end

      it "should decrease quality by 2 after when sell_in < 1" do
        expect {
          subject.update
        }.to change{ subject.quality }.by(-2)
      end

    end

  end # context base item

end

describe 'ConjuredItem' do
  subject { ConjuredItem.new :ignored, 10, 10 }

  it "should reduce quality by 2 on update_quality" do
    expect{ subject.update }.to change{subject.quality}.by(-2)
  end
end

describe 'SulfurasItem' do
  subject { SulfurasItem.new :ignored, 10, 10 }

  it "should not touch quality on update_quality" do
    expect{ subject.update }.to_not change{subject.quality}
  end
end

describe 'AgedBrieItem' do
  subject { AgedBrieItem.new :ignored, 10, 10}
  let!( :initial_quality ) { subject.quality }

  [1,10,100,1000].each do |age|
    context "when age increases by #{age}" do
      let!( :initial_quality ) { subject.quality }
      before(:each) { age.times{ subject.update_quality } }

      it "should increase in quality" do
        expect( subject.quality).to be > initial_quality
      end

      it "should not increase in quality over 50" do
        expect( subject.quality).to be <= 50
      end

    end
  end

end

describe 'BackstagePassesItem' do
  subject { BackstagePassesItem.new :ignored, 15, 20 }

  context "sell_in > 10" do
    it "should have a sell_in > 10" do
        expect( subject.sell_in ).to be > 10
    end

    it "should increase quality by 1 on update" do
      expect{ subject.update }.to change{subject.quality}.by(1)
    end
  end

  context "sell_in <= 10" do
    before(:each) { 5.times{ subject.update } }
    it "should have a sell_in <= 10" do
        expect( subject.sell_in ).to be <= 10
    end

    it "should increase quality by 2 on update" do
      expect{ subject.update }.to change{subject.quality}.by(2)
    end
  end
  context "sell_in <= 5" do
    before(:each) { 10.times{ subject.update } }
    it "should have a sell_in <= 5" do
        expect( subject.sell_in ).to be <= 5
    end

    it "should increase quality by 3 on update" do
      expect{ subject.update }.to change{subject.quality}.by(3)
    end
  end
  context "sell_in == 0" do
    before(:each) { 14.times{ subject.update } }
    it "should have a sell_in == 0" do
      expect{ subject.update }.to change{subject.sell_in}.to(0)
    end

    it "should have a quality of 0" do
      expect{ subject.update }.to change{subject.quality}.to(0)
    end
  end
end

describe 'InventoryItem' do
  subject { InventoryItem.new :ignored, 10, 10 }

  it { should respond_to(:update) }

  it "should decrease quality by one when update_quality called" do
    expect{ subject.update }.to change{ subject.quality }.by(-1)
  end
  it "should decrease sell_in by one when update_quality called" do
    expect{ subject.update }.to change{ subject.sell_in }.by(-1)
  end

end

describe 'ItemFactory' do
  subject { ItemFactory.new }
  it { should respond_to(:create) }

  it "creates a basic item" do
    expect(subject.create "name", 10, 15).to be_kind_of(Item)
  end

  it "creates conjured items" do
    expect(subject.create "Conjured Mana Cake", 10, 15).to be_kind_of(ConjuredItem)
  end

  it "creates sulfuras items" do
    expect(subject.create "Sulfuras, Hand of Ragnaros", 0, 80).to be_kind_of(SulfurasItem)
  end

  it "creates aged brie items" do
    expect(subject.create "Aged Brie", 2, 0).to be_kind_of(AgedBrieItem)
  end

  it "created backstage passes items" do
    expect(subject.create "Backstage passes to a TAFKAL80ETC concert", 0, 80).to be_kind_of(BackstagePassesItem)
  end

end