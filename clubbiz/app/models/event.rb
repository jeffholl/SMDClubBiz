class Event < ActiveRecord::Base
	
#	belongs_to :club

	has_many :shared_events
	has_many :clubs, :through => :shared_events

	has_many :event_comments

	has_many :tickets
	
	accepts_nested_attributes_for :shared_events, allow_destroy: true

end
