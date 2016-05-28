require "httparty"
module EventfulAPIWrapper
BASE_URL = "http://api.eventful.com"

  def self.search(term)
    @search_term = term
    # @response = HTTParty.get(BASE_URL + "#{@search_term}" + "&limit="+ "#{@limit}")
  end
end
