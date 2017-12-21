require 'rqrcode'

class DashboardController < ApplicationController
  def index
    @league_members = current_league.first.users rescue nil
    @user = current_user
    @users_results = current_user.horses.map(&:result) rescue nil
    @todays_meetings = Meeting.where("created_at >= ?", Time.zone.now.beginning_of_day)

    qrcode = RQRCode::QRCode.new("https://placepot.herokuapp.com")
    @qr = qrcode.as_svg(offset: 0, color: '000', shape_rendering: 'crispEdges', module_size: 8)
  end

  def fetch_league
    respond_to do |format|
      format.js { render template: 'dashboard/fetch_league', content_type: 'text/javascript' }
    end
  end

  def fetch_selection
    respond_to do |format|
      format.js { render template: 'dashboard/fetch_selections', content_type: 'text/javascript' }
    end
  end
end
