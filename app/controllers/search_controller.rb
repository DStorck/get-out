class SearchController < ApplicationController
  def index

  end

  def display_events
    response = EventfulAPIWrapper.search(params[:term])
    @response = response["events"]["event"]
    # binding.pry


    render :index
  end

end
