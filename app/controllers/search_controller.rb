class SearchController < ApplicationController
  def index

  end

  def display_events
    @response = EventfulAPIWrapper.search(params[:term])
    render :index
  end

end
