require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validations: uid can't be blank" do
    user = User.new

    assert_not user.valid?
    assert user.errors.keys.include?(:uid), "uid is not in the errors hash"
  end


 #  test "can authenticate known users" do
 #    doggy = users(:dog_merchant)
 #    assert_equal doggy, User.log_in(doggy.username, "password")
 #  end
 #
 #  test "won't authenticate mismatched data" do
 #    assert_not User.log_in("my_username", "notpassword")
 #  end
 #
 #  test "won't authenticate a known user with a bad password" do
 #    kitty = users(:cat_merchant)
 #    assert_not User.log_in(kitty.username, "guineapig")
 # end
 #
 #  test "Username for dog merchant should be dogs_yes" do
 #    assert_equal "dogs_yes", users(:dog_merchant).username
 #  end
 #
 #  test "User dog_merchant has the product dog_pirate" do
 #    assert_includes users(:dog_merchant).products, products(:dog_pirate)
 #  end
 #
 #  test "User cat_merchant has an order" do
 #    assert_includes users(:cat_merchant).orders, orders(:second_order)
 #  end
end
