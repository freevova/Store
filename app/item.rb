class Item 
	@@discount = 0.05
	
	def self.discount
		if Time.now.month == 1
			return @@discount + 0.1
		else
			return @@discount
		end
	end

	def self.show_info_about(attr, block)
		@@show_info_about ||= {}
		@@show_info_about[attr] = block
	end

	attr_reader :real_price, :name
	attr_writer  :real_price

	def initialize(name, options = {} )
		@real_price = options[:price]
		@name	  = name
	end
	
	def info
		yield real_price
		yield name
	end
	
	def price 
		(@real_price - @real_price * self.class.discount) + tax if @real_price
	end

	def to_s
		"#{self.name}:#{self.price}"
	end

	private
	def tax
		type_tax =  if self.class == VirtualItem
			2
		else
			1
		end
		cost_tax  = if @real_price > 10
			@real_price * 0.2
		else
			@real_price * 0.1
		end
		type_tax + cost_tax
	end

end

# item1 = Item.new(price: 100, name: 'Item', weight: 100)
# puts item1.price