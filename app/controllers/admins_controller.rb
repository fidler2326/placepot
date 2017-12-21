class AdminsController < ApplicationController

  before_filter :authorize_admin, only: :index

  def index
    @users = User.all
  end

  def toggle_admin
    @user = User.find(params[:user_id])
    @user.update_attributes(admin: !@user.admin)
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
end
