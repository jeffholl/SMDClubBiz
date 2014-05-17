class PagesController < ApplicationController
  def home
    @clubs = Club.all
    @events = Event.all
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
