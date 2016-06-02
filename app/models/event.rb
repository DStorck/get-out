class Event < ActiveRecord::Base
  belongs_to :user
  #attr_accessor :name, :uid, :location, :url, :description, :start_time, :venue

  def self.find_event(info)
    self.new(info)
  end

  def self.create_from_eventful(response)
    event = Event.new
    event.name = response["title"]
    event.uid = response["id"]
    event.location = response["city_name"]
    event.url = response["url"]
    event.description = response["description"]
    event.start_time = response["start_time"]
    event.venue = response["venue_name"]

    if event.save
      return event
    else
      return "tomato"
    end
  end

end
