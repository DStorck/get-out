require "httparty"
module EventfulAPIWrapper
BASE_URL = "http://api.eventful.com/json/events/search?&app_key=PNh8dcmkrJKGX8tx&keywords="

  def self.search(term, current_user)
    city = current_user ? current_user.city : "seattle"
    HTTParty.get(BASE_URL + term + "&location=#{city}", format: :json)
  end

end
