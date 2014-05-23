class Club < ActiveRecord::Base
	
#	has_many :events
	
	has_many :club_comments, dependent: :destroy
	
	has_many :shared_events, dependent: :destroy
	has_many :events, :through => :shared_events, dependent: :destroy
	
	has_many :memberships, dependent: :destroy
	has_many :users, :through => :memberships

	accepts_nested_attributes_for :memberships

	def self.search(query)
		where("club_name like ?", "%#{query}%")
	end

	def active_memberships
		self.memberships.where(status: "active")
	end

	def pending_memberships
		self.memberships.where(status: "pending")
	end

	def moderators
		self.memberships.where(role: "moderator")
	end

	def can_be_modified_by?(user)
		self.moderators.map(&:user_id).include? user.id
	end

end
