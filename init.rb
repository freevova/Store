require_relative 'app/store_application.rb'
#delayed_job

# StoreApplication.config
# p StoreApplication.respond_to?(:config)

#DSL Domain Specific Language
StoreApplication.config do |app|

	app.name = "My Store"
	app.environment = :production

	app.admin do |admin|
		admin.email = "freevova@ukr.net"
		admin.login = "admin"
		admin.send_info_emails_on :mondays
	end

end

# p StoreApplication.environment
# p StoreApplication.name
# p StoreApplication::Admin.email
# p StoreApplication::Admin.login


# unless StoreApplication.frozen?
# 	StoreApplication.name = "My name"	
# 	StoreApplication::Admin.email = "bad_mail@gmail.com"
# end


@item = []
@item << AntiqueItem.new( 'car', price: 101, weight: 2000)
@item << RealItem.new( price: 100, name: 'kettle', weight: 50)
@item << RealItem.new( price: 101, name: 'dishwasher', weight: 100)

cart = Cart.new("vova")
cart.add_item RealItem.new( price: 100, name: 'car', weight: 100)
cart.add_item RealItem.new( price: 100, name: 'car', weight: 150)
cart.add_item RealItem.new( price: 100, name: 'kettle', weight: 50)

order = Order.new
@item.each { |i| order.add_item(i) }
order.place
p order.placed_at.strftime("%b %-d, %Y %H:%M:%S") #Jan 18, 2016 17:00:00
p order.time_spend_to_send_email


# method = "all_cars"
# p cart.send(method)




# puts @item[0].kind_of?(AntiqueItem)    # true
# puts @item[0].kind_of?(Item)					 # true	
# puts @item[0].class == AntiqueItem     # true
# puts @item[0].class == Item    				 # false

# puts @item[0].respond_to?(:info)   		 # true
# puts @item[0].send(:tax)   		         # value

# p cart.all_kettles

# item1 = RealItem.new(price: 100, name: 'Item', weight: 100)
# puts item1.price
# @item[0].info { |a| puts a }