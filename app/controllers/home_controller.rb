class HomeController < ApplicationController
  def index
    @todays_meetings = Meeting.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
