class UserController < ApplicationController


  def favorite
    User.favorite(params, current_user)
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def show_faves
    @favorites = Favorite.where(user_id: current_user.id)
    render :favorite
  end

  def search_favorites
    @event_instances = User.search_favorites(current_user)
    render :search_favorites
  end

end
