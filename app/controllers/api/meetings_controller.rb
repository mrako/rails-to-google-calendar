class Api::MeetingsController < ApplicationController
  include ActionController::MimeResponds

  def index
    meetings = [Meeting.new("title1"), Meeting.new("title2")]

    calendar = Icalendar::Calendar.new

    meetings.each do |meeting|
      calendar.add_event(meeting.to_ics)
    end

    calendar.publish

    respond_to do |format|
      format.ics { render text: calendar.to_ical }
    end
  end
end
