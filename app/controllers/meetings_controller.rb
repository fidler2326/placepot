class MeetingsController < ApplicationController
  helper_method :get_meeting

  def get_meeting
    require 'open-uri'
    doc = Nokogiri::HTML(open("https://beta.racingpost.com/racecards/"))

    racecards = doc.css('.ui-accordion__row')

    racecards.each do |racecard|
      url = racecard.css('.RC-meetingList__showAll').attr('href')
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
          Horse.create!(race_id: Race.last.id, name: name)
        end
      end
    end
  end

  def index
    @users = User.all
    @meetings = Meeting.all
  end
end
