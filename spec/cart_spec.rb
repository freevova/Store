require "rspec"
require_relative '../app/item.rb'
require_relative '../app/virtual_item.rb'
require_relative '../app/antique_item.rb'
require_relative '../app/item_container.rb'
require_relative '../app/cart.rb'

describe Cart do

	it "makes sure the cart is initialized correctly" do
		cart = Cart.new("vova")
		expect(cart.items).to be_kind_of(Array)
		expect(cart.owner).not_to be_nil
	end

	describe "managing items" do
		it "adds items into cart" do
			cart = Cart.new('vova')
			item1 = Item.new('kettle', price: 200)
			item2 = Item.new('kettle', price: 200)
			cart.add_items(item1, item2)
			#cart.items.should include(item1, item2)
			expect(cart.items).to include(item1, item2)
		end

		it "removes items from itself" do
		end
	end

	it "counts items in itself" do
		end
	it "places order using all the items that were added into the cart" do
		end
	it "clears itself off the items after an order" do
		end
	
end