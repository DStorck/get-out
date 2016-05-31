class SearchController < ApplicationController
  def index

  end

  def display_events
    initial_response = EventfulAPIWrapper.search(params[:term])
    response_array = initial_response["events"]["event"]
    @event_instances = []
    response_array.each do |event|
      temp = Event.find_event(event)
      @event_instances << temp
    end
    
    render :index
  end

end
