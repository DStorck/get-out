require "httparty"
module EventfulAPIWrapper
BASE_URL = "http://api.eventful.com/json/events/search?&app_key=PNh8dcmkrJKGX8tx&keywords="

  def self.search(term, current_user)
    city = current_user ? current_user.city : "seattle"
    initial_response = HTTParty.get(BASE_URL + term + "&location=#{city}", format: :json)
    response_array = initial_response["events"]["event"] if initial_response["total_items"] != "0"
    @event_instances = []
    if initial_response["total_items"].to_i == 1
      @event_instances << Event.create_from_eventful(response_array)
    elsif initial_response["total_items"].to_i > 1
      response_array.each do |event|
        temp = Event.create_from_eventful(event)
        @event_instances << temp
      end
    end
    @event_instances
  end

end
