class SearchController < ApplicationController
  def index

  end

  def display_events
  
    initial_response = EventfulAPIWrapper.search(params[:term])
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
    render :index
  end



end
