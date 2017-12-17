class LeaguesController < ApplicationController

  before_action :authenticate_user!

  def new
    @league = League.new
    @todays_meetings = Meeting.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def index
    @todays_meetings = Meeting.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def create
    @league = League.new(league_params)
    @league.users << current_user
    @league.steward = current_user.id
    respond_to do |format|
      if @league.save
        format.html { redirect_to root_path, notice: 'League was successfully created.' }
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
    @todays_meetings = Meeting.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def join
    # TODO: Setting a random league to avoid error (probably a better way round this)
    @league = League.last
  end

  def update
    code = params[:code]
    @league = League.where(join_code: code)
    respond_to do |format|
      unless @league.first.nil?
        if current_user.leagues.where(join_code: code).first.nil?
          # Add the current user to league
          @league.first.users << current_user
          format.html { redirect_to root_path, notice: 'Joined league.' }
        else
          format.html { redirect_to join_path, notice: 'You are already part of this league.' }
        end
      else
        format.html { redirect_to join_path, notice: 'League code wrong.' }
      end
    end
  end

  private
    def league_params
      params.require(:league).permit(:name, :meeting, :join_code, :steward, :user_id)
    end
end
