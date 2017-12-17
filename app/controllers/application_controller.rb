class ApplicationController < ActionController::Base

  helper_method :current_league
  helper_method :current_meeting

  def current_league
    current_user.leagues.where("leagues.created_at >= ?", Time.zone.now.beginning_of_day) if current_user
  end

  def current_meeting
    Meeting.where(id: current_league.first.meeting) rescue nil
  end

  def authorize_admin
    redirect_to :back, status: 401 unless current_user.admin
    #redirects to previous page
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
