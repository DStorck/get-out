class User < ActiveRecord::Base
  has_many :favorites
  has_many :events

  def self.find_or_create_from_omniauth(auth_hash)
  # Find or create a user
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



end
