class Meeting < ActiveRecord::Base
  attr_accessible :description, :end_time, :location, :start_time, :title
  validates :start_time,  presence: true
  validates :end_time,    presence: true
  validates :title, presence: true

  PUBLIC_URL = "http://localhost:3000/"


  def to_ics
    event = Icalendar::Event.new

    event.dtstart     = self.start_time
    event.dtend       = self.end_time
    event.summary     = self.title
    event.description = self.description
    event.ip_class    = "PRIVATE"

    event
  end
end
