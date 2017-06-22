class RacecardsController < ApplicationController
  def new
    @racecard = Racecard.new
    @meetings = Meeting.all
  end

  def create
    @racecard = Racecard.new(racecard_params)

    @racecard.save
    redirect_to @racecard
  end

  def index
    @racecards = Racecard.all
  end

  def show

  end

  private
  def racecard_params
    params.require(:racecard).permit(selection: [])
  end
end
