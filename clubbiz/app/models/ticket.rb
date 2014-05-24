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

end