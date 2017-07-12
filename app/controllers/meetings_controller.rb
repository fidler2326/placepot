class MeetingsController < ApplicationController
  helper_method :get_meetings

  def get_meetings
    begin
      require 'open-uri'
      doc = Nokogiri::HTML(open("https://beta.racingpost.com/racecards/"))

      racecards = doc.css('.ui-accordion__row')

      racecards.each do |racecard|
        url = racecard.css('.RC-meetingList__showAll').first.attr('href')
        html = Nokogiri::HTML(open("https://beta.racingpost.com" + url))

        racecourse = html.css('.RC-meetingDay__titleName').text
        Meeting.create!(racecourse: racecourse)

        races = html.css('.RC-meetingDay__race')

        races.each do |race|
          time = race.css('.RC-meetingDay__raceTime').text
          Race.create!(meeting_id: Meeting.last.id, time: time)
          horses = race.css('.RC-runnerRow')
          horses.each do |horse|
            name = horse.css('.RC-runnerName').text
            Horse.create!(race_id: Race.last.id, meeting_id: Meeting.last.id, name: name)
          end
        end
      end
      render :new
    rescue

    end
  end

  def index
    @users = User.all
    @meetings = Meeting.all
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
