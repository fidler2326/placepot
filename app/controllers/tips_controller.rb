class TipsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @tip = Tip.new

    @meetings = Meeting.all
    @horses = Horse.all
  end

  def create
    @tip = Tip.new(tips_params.merge({ user_id: current_user.id, league_id: current_league.first.meeting }))

    @tip.save
    redirect_to @tip
  end

  def update
    @tip = Tip.find(params[:id])

    if @tip.update(tips_params)
      redirect_to action: "show"
    else
      render 'edit'
    end
  end

  def index
    @tips = current_user.tips.where(league_id: current_league.first.meeting)
  end

  def show
    @tip = Tip.find(params[:id])
    @meetings = Meeting.all
  end

  def edit
    @tip = Tip.find(params[:id])
    @meetings = Meeting.all
    @horses = Horse.all
  end

  def upvote
    @tip = Horse.find(params[:id])
    @tip.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @tip = Horse.find(params[:id])
    @tip.downvote_by current_user
    redirect_to :back
  end

  private
  def tips_params
    params.require(:tip).permit(:horse_id, :horses, horse_ids:[])
  end
end
