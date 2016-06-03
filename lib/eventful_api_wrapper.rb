require "httparty"
module EventfulAPIWrapper
BASE_URL = "http://api.eventful.com/json/events/search?&app_key=PNh8dcmkrJKGX8tx&keywords="

  def self.search(term, current_user)
    city = current_user.city || "Seattle"
    @search_term = term
    @response = HTTParty.get(BASE_URL + "#{@search_term}" + "&location="+ "#{city}", format: :json)
  end

end
