class Ticket < ActiveRecord::Base
	
	belongs_to :event
	
	has_many :ticket_allocations, dependent: :destroy
	has_many :users, :through => :ticket_allocations, dependent: :destroy
	
end