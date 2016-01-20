class StoreApplication

	class << self

		def config
			unless @instance
				yield(self) 										# self - class: StoreApplication
				puts "loading files..."
				#puts self	.class								# Class
				require "pony"
				require_relative 'string.rb'
				require_relative 'item_container.rb'
				require_relative 'item.rb'
				require_relative 'virtual_item.rb'
				require_relative 'real_item.rb'
				require_relative 'antique_item.rb'
				require_relative 'cart.rb'
				require_relative 'order.rb'
			end
			@instance ||= self
			@instance.freeze
		end

		attr_accessor :name, :environment

		def admin(&block)
			@admin ||= Admin.new(&block)
		end

	end

	class Admin
			
		class << self

			def new
				unless  @instance
					yield(self)         # self - class: Admin
				end
				@instance ||= self
				@instance.freeze
			end

			attr_accessor :email, :login

			def send_info_emails_on(day)
				@send_info_emails_on = day
			end

		end

	end

end