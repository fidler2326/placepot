class DashboardController < ApplicationController
  def index
    @league_members = current_league.first.users rescue nil
    # @users = @league_members.map(&:votes) # current_meeting.first.races.select(&:horses)
    # @users = current_league.first.users.map(&:find_voted_items).first.collect{|h| h.result}
    # current_league.first.users.map(&:find_voted_items)
    # @selections = current_user.find_voted_items
    @user = current_user
    # Get users horses Results
    @users_results = current_user.horses.map(&:result) rescue nil
  end
end
