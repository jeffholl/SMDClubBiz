class Club < ActiveRecord::Base
	
#	has_many :events
	
	has_many :club_comments, dependent: :destroy
	
	has_many :shared_events, dependent: :destroy
	has_many :events, :through => :shared_events, dependent: :destroy
	
	has_many :memberships, dependent: :destroy
	has_many :users, :through => :memberships

end
