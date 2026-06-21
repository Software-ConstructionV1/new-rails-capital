require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "requires all fields" do
    user = User.new

    assert_not user.valid?
    assert_includes user.errors[:name], "can't be blank"
    assert_includes user.errors[:dob], "can't be blank"
    assert_includes user.errors[:email], "can't be blank"
    assert_includes user.errors[:phone_number], "can't be blank"
    assert_includes user.errors[:address], "can't be blank"
  end

  test "requires valid email format" do
    user = users(:one)
    user.email = "invalid-email"

    assert_not user.valid?
    assert_includes user.errors[:email], "is invalid"
  end

  test "requires unique email" do
    user = users(:one).dup
    user.email = users(:one).email

    assert_not user.valid?
    assert_includes user.errors[:email], "has already been taken"
  end
end
