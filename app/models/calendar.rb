class Calendar
  attr_accessor :calendar

  def initialize(events=[])
    self.calendar = Icalendar::Calendar.new

    set_meta_data
    add_events(events)
  end

  def to_ical
    self.calendar.publish
    self.calendar.to_ical
  end

private
  def set_meta_data
    self.calendar.x_published_ttl = "PT1H"
    self.calendar.x_wr_calname = "calendar name"
    self.calendar.x_wr_caldesc = "calendar description"

    self.calendar.append_custom_property "REFRESH-INTERVAL;VALUE=DURATION", "PT1H"
    self.calendar.append_custom_property "NAME", "calendar name custom property"
    self.calendar.append_custom_property "DESCRIPTION", "calendar description custom property"
    self.calendar.prodid = "trail.fi"
  end

  def add_events(events)
    events.each do |event|
      self.calendar.add event
    end
  end

  def sample_event
    event = Icalendar::Event.new
    event.uid= match.id
    start_date = match.date
    end_date = match.date + 90.minutes
    event.dtstart = DateTime.civil(start_date.year, start_date.month, start_date.day, start_date.hour, start_date.min)
    event.dtend = DateTime.civil(end_date.year, end_date.month, end_date.day, end_date.hour, end_date.min)
    event.summary = match.group.name
    event.created = match.created_at
    event.location = match.location
    event.url = h.root_url
    event.last_modified = match.updated_at
    event.organizer = "sporgla.us"
    event
  end
end
