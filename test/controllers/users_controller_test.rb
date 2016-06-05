require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "can show user profile" do
    get(:profile, id: 1)
    assert_response :success
  end
end
