class Event < ActiveRecord::Base
	
#	belongs_to :club

	has_many :shared_events, dependent: :destroy
	has_many :clubs, :through => :shared_events

	has_many :event_comments

	has_many :tickets, dependent: :destroy
	
	accepts_nested_attributes_for :shared_events

	def self.search(query)
		where("event_name like ?", "%#{query}%")
	end

	def host_club
		Club.find(self.shared_events.where(role: "owner").first.club_id)
	end

	# handling .R.. permissions
	def can_be_viewed_by(user)
		
	end

	# handing C.UD permissions
	def can_be_created_by(user)

	end

end
