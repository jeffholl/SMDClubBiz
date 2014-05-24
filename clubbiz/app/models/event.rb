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

	def self.all_active
		where(status: "active")
	end

	def host_club
		Club.find(self.shared_events.where(role: "owner").first.club_id)
	end

	def associate_clubs
		self.shared_events.where(role: "shared")
	end

	# handling .R.. permissions
	def can_be_viewed_by?(user)
		self.host_club.active_members.map(&:user_id).include? user.id
	end

	# handing C.UD permissions
	def can_be_modified_by?(user)
		self.host_club.moderators.map(&:user_id).include? user.id
	end

end
