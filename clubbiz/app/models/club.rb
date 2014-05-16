class Club < ActiveRecord::Base
	
#	has_many :events
	
	has_many :club_comments
	
	has_many :shared_events
	has_many :events, :through => :shared_events
	
	has_many :memberships
	has_many :users, :through => :memberships

end
