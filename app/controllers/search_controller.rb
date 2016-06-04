class SearchController < ApplicationController

  def display_events
    @event_instances = EventfulAPIWrapper.search(params[:term], current_user)
    render :index
  end

end
