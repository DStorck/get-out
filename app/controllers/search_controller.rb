class SearchController < ApplicationController
  def index
    client = EventfulApi::Client.new(:oauth_token => 'token', :oauth_secret => 'token secret')
  end
end
