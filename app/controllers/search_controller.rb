class SearchController < ApplicationController
  def index

  end

  def display_events
    initial_response = EventfulAPIWrapper.search(params[:term])
    response_array = initial_response["events"]["event"] if initial_response["total_items"] != "0"
    @event_instances = []
    if initial_response["total_items"] == '1'
      @event_instances << Event.find_event(response_array)
    elsif initial_response["total_items"].to_i > 1
      response_array.each do |event|
        temp = Event.find_event(event)
        @event_instances << temp
      end
    end

    render :index
  end



end
