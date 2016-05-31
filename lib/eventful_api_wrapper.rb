require "httparty"
module EventfulAPIWrapper
BASE_URL = "http://api.eventful.com/json/events/search?location=Seattle&app_key=PNh8dcmkrJKGX8tx&keywords="

  def self.search(term)
    client = EventfulApi::Client.new(:oauth_token => 'token', :oauth_secret => 'token secret')
    @search_term = term
    @response = HTTParty.get(BASE_URL + "#{@search_term}", format: :json)
  end

  def self.music_search(term)
    @search_term = term
    @response = HTTParty.get(BASE_URL + "#{@search_term}" + "&category=music", format: :json)
  end



end
