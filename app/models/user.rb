class User < ActiveRecord::Base
  has_many :favorites
  has_many :events

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["info"]["id"], provider: auth_hash["provider"])
    if !user.nil?
      return user
    else
      user = User.new
      user.uid = auth_hash["info"]['id']
      user.provider = auth_hash['provider']
      user.name = auth_hash["info"]["display_name"]

      if user.save
        return user
      else
        return nil
      end
    end
  end

  def self.favorite(params, current_user)
    name = params[:name]
    category = params[:category]
    fav = Favorite.create(name: name, category: category, user_id: current_user.id)
  end

  def self.search_favorites(current_user)
    fav_keywords = Favorite.where(user_id: current_user.id).map{ |fav| fav.name }
    @event_instances = []
    fav_keywords.each do |keyword|
      initial_response  = EventfulAPIWrapper.search(keyword)
      response_array = initial_response["events"]["event"] if initial_response["total_items"] != "0"

      if initial_response["total_items"].to_i == 1
        @event_instances << Event.create_from_eventful(response_array)
      elsif initial_response["total_items"].to_i > 1
        response_array.each do |event|
          temp = Event.create_from_eventful(event)
          @event_instances << temp
        end

      end
    end
    @event_instances

  end
end
