require "rspec"
require_relative '../app/item.rb'
require_relative '../app/virtual_item.rb'
require_relative '../app/item_container.rb'

class ItemBox
	include ItemContainer
	
	def initialize
		@items = []
	end
end

describe ItemContainer do

	before(:each) do
		@box = ItemBox.new
		@item1 = Item.new("kettle", price: 200)
		@item2 = Item.new("kettle", price: 200)
	end

	it "shows minimum price for the item" do
		expect(ItemBox.min_price).to be(100)
	end

	it "adds item into the container" do
		@box.add_item(@item1)
		@box.add_item(@item2)
		expect(@box.items.size).to eq(2)
		# expect(@box.items).to have(2).items
		# @box.items.should have(2).items
	end

	it "removes item from the container" do
		@box.add_item(@item1)
		@box.add_item(@item2)
		expect(@box.remove_item).to be(@item2)
		@box.remove_item
		expect(@box.items).to be_empty
	end

	it "reises an error when user is trying to add anything else but an item" do
		expect { @box.add_item("something else") }.to raise_error(NoMethodError)
	end
end