require "rspec"
require_relative '../app/item.rb'
require_relative '../app/virtual_item.rb'

describe Item do

	before(:each) do
		@item = Item.new('kettle', price: 200)
	end

	before(:all)   {}
	after(:each)   {}
	after(:all)    {}

	it "calculates price according to a special formula" do
		#item.price.should == 211
		expect(@item.price) == 211
	end

	it "returns an info about an object" do
		expect(@item.to_s) == "kettle:200"
	end

	it "calculates tax" do
		expect(@item.send(:tax)).not_to be_nil
	end
	
end