class ClubAdminsController < ApplicationController

	before_action :set_club, only: [:dashboard, :events, :settings]

  def dashboard
  end

  def events
  end

  def settings
  end

  private
  	def set_club
  		@club = Club.find(params[:id])
  	end
end
