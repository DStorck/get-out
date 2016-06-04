require 'test_helper'

class EventTest < ActiveSupport::TestCase

  describe "Event Model" , :vcr do
    before do
      @lumineers = EventfulAPIWrapper.search("lumineers", nil)
    end

    it "it will create events from eventfulapi response" do

    end
  end

end


#
# event.name = response["title"]
# event.uid = response["id"]
# event.location = response["city_name"]
# event.url = response["url"]
# event.start_time = response["start_time"]
# event.venue = response["venue_name"]
