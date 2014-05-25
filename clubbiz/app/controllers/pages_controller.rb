class PagesController < ApplicationController
  before_action :admin_redirect, only: :home
  def home
    @clubs = Club.all
    @events = Event.all
    if signed_in?
      @user = User.find(current_user)
    end
    @my_news = ClubComment.all
  end

  def about
  end

  def help
  end

  def terms
  end

  def privacy
  end

  def search
    if params[:q] && params[:q] != ""
      @clubs = Club.search(params[:q]).order("created_at DESC")
      @events = Event.search(params[:q]).order("created_at DESC")
    else
      @clubs = Club.all.order("created_at DESC").limit(3)
      @events = Event.all.order("created_at DESC").limit(3)
    end
  end

  private
    def admin_redirect
      if signed_in? && current_user.admin?
        redirect_to admins_dashboard_path
      end
    end
end
