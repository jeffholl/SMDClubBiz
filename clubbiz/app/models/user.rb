class User < ActiveRecord::Base
  
	has_many :ticket_allocations, dependent: :destroy
	has_many :tickets, :through => :ticket_allocations, dependent: :destroy

	has_many :memberships, dependent: :destroy
	has_many :clubs, :through => :memberships, dependent: :destroy

	def displayname
		"#{first_name} #{last_name}"
	end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
