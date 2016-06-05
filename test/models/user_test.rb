require 'test_helper'

class UserTest < ActiveSupport::TestCase


  def setup
    @known = {
      "provider" => "spotify",
      "info" => { "id" => "known_user" } }
    @unknown = { "provider" => "spotify",
      "info" => { "id" => "unknown_user" } }
  end

  test "validations: uid can't be blank" do
    user = User.new

    assert_not user.valid?
    assert user.errors.keys.include?(:uid), "uid is not in the errors hash"
  end

  test "can make a new user given the oauth spotify hash of an unknown user" do
    assert_difference 'User.count', 1 do
      @user = User.find_or_create_from_omniauth @unknown
    end
  end

  test "can find an existing user given an oauth spotify hash" do
    assert_equal users(:known_user), User.find_or_create_from_omniauth(@known)
  end

  test "uses oauth data to set user name, provider and uid for new users" do
   user = User.find_or_create_from_omniauth @unknown

   assert_equal @unknown['provider'], user.provider
   assert_equal @unknown['info']['id'], user.uid
  end

  test "validation: provider must be spotify" do
    user = User.new
    user.provider = "monkey face"
    assert_not user.valid?
    assert user.errors.keys.include?(:provider), "provider is not in the errors hash"
  end


  test "validation: provider must be present" do
    user = User.new
    assert_not user.valid?
    assert user.errors.keys.include?(:provider), "provider is not the errors hash"
  end

  test "validation: uid must be present" do
    user = User.new
    assert_not user.valid?
    assert user.errors.keys.include?(:uid), "uid is not in the errors hash"
  end


  test "User first_user has the favorite keyword trivia" do
    assert_includes users(:first_user).favorites, favorites(:first_fave)
  end

  test "User first_user has a saved event" do
    assert_includes users(:first_user).events, events(:cat_wrestling)
  end

  test "user can favorite a search term" do
    assert_difference 'Favorite.count', 1 do
      params = {name: 'taco'}
      User.favorite(params, users(:known_user))
    end
  end


  describe "API" , :vcr do
      before do
        @known = {
          "provider" => "spotify",
          "info" => { "id" => "known_user" } }
        @current_user = User.find_or_create_from_omniauth(@known)
      
      end

      it "can search all favorited terms and return event instances" , :vcr do
        @user_events = User.search_favorites(@current_user)
        assert_equal @user_events[0].class, Event
      end
  end

end
