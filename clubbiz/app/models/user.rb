class User < ActiveRecord::Base
  
	has_many :ticket_allocations, dependent: :destroy
	has_many :tickets, :through => :ticket_allocations, dependent: :destroy

	has_many :memberships, dependent: :destroy
	has_many :clubs, :through => :memberships, dependent: :destroy

	def displayname
		"#{first_name} #{last_name}"
	end

	def is_member?(club)
		club.active_memberships.map(&:user_id).include? self.id
	end

	def is_pending?(club)
		club.pending_memberships.map(&:user_id).include? self.id
	end

	def admin?
		self.role == "admin"
	end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
