class Ticket < ActiveRecord::Base
	
	belongs_to :event
	
	has_many :ticket_allocations
	has_many :users, :through => :ticket_allocations
	
end