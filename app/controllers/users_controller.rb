class UsersController < ApplicationController
  before_action :require_login

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

  def delete_fave
    fave = Favorite.find(params[:fave_id])
    fave.delete
    @favorites = Favorite.where(user_id: current_user.id)
    render :favorite
  end

  def user_events
    delete_past_events
    @user_events = Event.where(user_id: current_user.id).order(:start_time)
    render :add_event
  end

  def profile
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    city = params[:city] == "" ? current_user.city : params[:city]
    name = params[:name] == "" ? current_user.name : params[:name]
    @user.update(city: city, name: name)
    redirect_to root_path
  end

  private

  def delete_past_events
    @user_events = Event.where(user_id: current_user.id)
    now = Time.now.utc
    @user_events.each do |event|
      Event.delete(event.id) if now - event.start_time > 0
    end
  end
end
