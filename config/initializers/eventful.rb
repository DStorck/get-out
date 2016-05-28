require "eventful_api"

EventfulApi.configure do |config|
   config.app_key = ENV["EVENTFUL_APPLICATION_KEY"]
   config.consumer_key = ENV["EVENTFUL_CONSUMER_KEY"]
   config.consumer_secret = ENV["EVENTFUL_CONSUMER_SECRET"]
 end
