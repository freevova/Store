require_relative 'init.rb'

cart = Cart.new(ARGV.delete_at(0))

ARGV.each do |a|
	@item.each { |i| cart.add_item(i) if a == i.name }
end

cart.read_from_file
begin
	cart.save_to_file
rescue Cart::ItemNotSupported
	puts "One of the items you are trying to save is not supported by Cart. Unsupported item classes are: #{Cart::UNSUPPORTED_ITEMS}."
end

