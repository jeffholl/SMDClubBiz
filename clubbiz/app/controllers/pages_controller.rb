class PagesController < ApplicationController
  def home
    @clubs = Club.all
    @events = Event.all
    if signed_in?
      @user = User.find(current_user)
    end
  end

  def about
  end

  def help
  end

  def terms
  end

  def privacy
  end
end
