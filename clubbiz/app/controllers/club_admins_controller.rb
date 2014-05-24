class ClubAdminsController < ApplicationController

	before_action :set_club, only: [:dashboard, :events, :settings]

  def dashboard
  	@display_events = @club.events.order("start_datetime DESC")
  end

  def events
  	@shared_event_requests = @club.shared_events.where(role: "pending")
  end

  def settings
  end

  private
  	def set_club
  		@club = Club.find(params[:id])
  	end
end
