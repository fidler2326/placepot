class LeaguesController < ApplicationController

  before_action :authenticate_user!

  def new
    @league = League.new
    @todays_meetings = Meeting.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def create
    @league = League.new(league_params)
    @league.users << current_user
    respond_to do |format|
      if @league.save
        format.html { redirect_to leagues_path, notice: 'Client was successfully created.' }
        format.json { render action: 'show', status: :created, location: @league }
      else
        format.html { render action: 'new' }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @league = League.find(params[:id])
    @meeting = Meeting.where(id: @league.meeting)
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    @league.users << current_user
    if @league.update(league_params)
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  private
    def league_params
      params.require(:league).permit(:meeting, :join_code, :user_id)
    end
end
