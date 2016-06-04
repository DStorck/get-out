require 'test_helper'

class EventfulAPIWrapperTest < ActiveSupport::TestCase

  describe "EventfulWrapper" do

    describe "API" , :vcr do
      before do
        @cat_events_seattle = EventfulAPIWrapper.search("cat", nil)
        @ray_event = EventfulAPIWrapper.search("ray lamontagne", nil)
        @no_events = EventfulAPIWrapper.search("ksdjfkjsdf", nil)
      end

      it "sends out a search term and returns event instances" do
        assert_equal @cat_events_seattle[0].class, Event
      end

      it "can handle getting a response with one event" do
        assert_equal @ray_event.count, 1
      end

      it 'can handle getting a response with no events' do
        assert_equal @no_events, []
      end


    end
  end
end
