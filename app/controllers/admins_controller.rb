class AdminsController < ApplicationController

  before_filter :authorize_admin, only: :index

  def index
    @users = User.all
  end
end
