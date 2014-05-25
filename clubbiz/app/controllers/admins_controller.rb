class AdminsController < ApplicationController
	layout "admin"
  
	before_action :get_club, only: :pending_club

  def dashboard
  	@pending_clubs = Club.get_pending
  	@prereg_clubs = Club.all.where(status: "prereg")
  end

  def pending_club
  end

  private 
  	def get_club
  		@club = Club.find(params[:id])
  	end

end
