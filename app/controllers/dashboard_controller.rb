class DashboardController < ApplicationController
  def index
    @league_members = current_league.first.users rescue nil
    @user = current_user
    @users_results = current_user.horses.map(&:result) rescue nil
  end
end
