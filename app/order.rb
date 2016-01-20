class Order
	attr_reader :items, :placed_at, :time_spend_to_send_email

	include ItemContainer

	def initialize
		@items = Array.new
		#.....
	end

	def place
		@placed_at = Time.now
		# mock
		thr = Thread.new do
			Pony.mail({
			  :to => StoreApplication::Admin.email,
			  :from => "My Store <freevova21@gmail.com>",
			  :via => :smtp,
			  :via_options => {
			    :address              => 'smtp.gmail.com',
			    :port                 => '587',
			    :enable_starttls_auto => true,
			    :user_name            => 'freevova21@gmail.com',
			    :password             => '21041991vovan',
			    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
			    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
			  },
			subject: "New order has been placed", body: "Please, check back your admin page to see it"
			})
		end
		while(thr.alive?)
			puts "."
			sleep(2)
		end
		send_email_at = Time.now
		@time_spend_to_send_email = send_email_at - @placed_at
	end
end

