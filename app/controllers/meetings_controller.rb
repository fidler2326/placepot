class MeetingsController < ApplicationController
  before_action :authenticate_user!
  helper_method :get_meetings

  def get_meetings
    begin
      require 'open-uri'
      doc = Nokogiri::HTML(open("https://beta.racingpost.com/racecards/"))

      racecards = doc.css('.ui-accordion__row')

      racecards.each do |racecard|
        url = racecard.css('.RC-meetingList__showAll').first.attr('href')
        html = Nokogiri::HTML(open("https://beta.racingpost.com" + url))

        racecourse = html.css('.RC-meetingDay__titleName').text.strip
        Meeting.create!(racecourse: racecourse)

        races = html.css('.RC-meetingDay__race')

        races.each do |race|
          time = race.css('.RC-meetingDay__raceTime').text.strip
          Race.create!(meeting_id: Meeting.last.id, time: time)
          horses = race.css('.RC-runnerRow')
          horses.each do |horse|
            program_number = horse.css('.RC-runnerNumber__no').text.strip
            name = horse.css('.RC-runnerName').text.strip
            form = horse.css('.RC-runnerInfo__form').text.strip
            trainer = horse.css('.RC-runnerInfo_trainer .RC-runnerInfo__name').text.strip
            jockey = horse.css('.RC-runnerInfo_jockey .RC-runnerInfo__name').text.strip
            Horse.create!(race_id: Race.last.id, meeting_id: Meeting.last.id, program_number: program_number, name: name, form: form, trainer: trainer, jockey: jockey)
          end
        end
      end
    rescue => ex

    end
    render 'dashboard/index'
  end

  def reset_meetings
    Meeting.where("created_at >= ?", Time.zone.now.beginning_of_day).destroy_all
    League.where("created_at >= ?", Time.zone.now.beginning_of_day).destroy_all
    render 'dashboard/index'
  end

  def index
    @users = User.all
    @meetings = Meeting.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])

    if @meeting.update(meeting_params)
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  private
    def meeting_params
      params.require(:meeting).permit(:racecourse, :meeting_date, races_attributes: [:id, :race_time, :_destroy, horses_attributes: [:id, :horse, :ew, :result, :_destroy]])
    end
end
