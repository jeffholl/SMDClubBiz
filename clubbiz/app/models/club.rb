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

end
