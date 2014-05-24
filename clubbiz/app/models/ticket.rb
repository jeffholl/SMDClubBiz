class Ticket < ActiveRecord::Base
	
	belongs_to :event
	
	has_many :ticket_allocations, dependent: :destroy
	has_many :users, :through => :ticket_allocations, dependent: :destroy
	
	def no_reserved
		self.ticket_allocations.map(&:quantity).sum
	end

	def any_remaining?
		self.no_reserved < self.quantity
	end

	def get_sale_status
		if self.start_sale_datetime < Time.now
			if self.end_sale_datetime > Time.now
				:onsale
			else 
				:postsale
			end 
		else 
			:presale
		end 
	end

	def self.current_sale
		now = Time.now
		where(' DATE(?) BETWEEN start_sale_datetime AND end_sale_datetime', now )
	end
end