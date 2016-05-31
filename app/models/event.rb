class Event < ActiveRecord::Base
  belongs_to :user
  attr_reader :name, :uid, :location, :url, :description, :when, :venue

  def initialize(response)
    @name = response["title"]
    @uid = response["id"]
    @location = response["city_name"]
    @url = response["url"]
    @description = response["description"]
    @when = response["start_time"]
    @venue = response["venue_name"]
  end

  def self.find_event(info)
    self.new(info)

  end



end
