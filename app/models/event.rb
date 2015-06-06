class Event
  attr_accessor :title, :start_time, :end_time, :location, :description

  def initialize(title, start_time=Time.now, end_time=(Time.now+8.hours), location=nil, description=nil)
    self.title = title
    self.start_time = start_time
    self.end_time = end_time
    self.location = location
    self.description = description
  end

  def to_ics
    event = Icalendar::Event.new

    event.dtstart     = self.start_time
    event.dtend       = self.end_time
    event.summary     = self.title
    event.location    = self.location
    event.description = self.description
    event.ip_class    = "PRIVATE"

    event.uid = event.url = "https://trail-google-calendar.herokuapp.com/api/events/#{self.title}"

    event
  end
end