class EventComment < ActiveRecord::Base
	
	belongs_to :events
	belongs_to :user
	
end