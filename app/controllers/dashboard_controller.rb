class DashboardController < ApplicationController
  def index
    @current_league = current_user.leagues.where("leagues.created_at >= ?", Time.zone.now.beginning_of_day)
    @current_meeting = Meeting.where(id: @current_league.first.meeting) rescue nil
  end
end
