class Api::EventsController < ApplicationController
  include ActionController::MimeResponds

  def index
    date1 = DateTime.new(2015, 6, 4, 9, 0, 0)
    date2 = DateTime.new(2015, 6, 8, 12, 0, 0)

    events = [Event.new("First reservation (less than 8 hours)", date1, date1+5.hours, "The changed fake event location", "Description of the reservation"),
              Event.new("title2", date2, date2+7.days)]

    calendar = Calendar.new(events)

    respond_to do |format|
      format.ics { render text: calendar.to_ical }
    end
  end
end
