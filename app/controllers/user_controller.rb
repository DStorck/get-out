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

  def add_event
    event = Event.find_by(id: params[:event_id])
    event.update(user_id: current_user.id)
    @user_events = Event.where(user_id: current_user.id)
  end

  def delete_event
    event = Event.find_by(id: params[:event_id])
    event.delete
    @user_events = Event.where(user_id: current_user.id)
    render :add_event
  end

  def user_events
    @user_events = Event.where(user_id: current_user.id).order(:start_time)
    render :add_event
  end

end
