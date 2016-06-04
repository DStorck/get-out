class Event < ActiveRecord::Base
  belongs_to :user

  def self.create_from_eventful(response)
    event = Event.new
    event.name = response["title"]
    event.uid = response["id"]
    event.location = response["city_name"]
    event.url = response["url"]
    event.start_time = response["start_time"]
    event.venue = response["venue_name"]

    if event.save
      return event
    else
      return nil
    end
  end

end
