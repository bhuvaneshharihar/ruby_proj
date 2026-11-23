require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "creates a user with a valid email and password" do
    user = User.new(email: "  USER@example.com ", password: "password123")

    assert user.valid?
    assert_equal "user@example.com", user.email
  end

  test "requires a unique email" do
    User.create!(email: "user@example.com", password: "password123")
    duplicate = User.new(email: "USER@example.com", password: "password123")

    assert_not duplicate.valid?
    assert duplicate.errors[:email].any?
  end

  test "authenticates with the password" do
    user = User.create!(email: "user@example.com", password: "password123")

    assert user.authenticate("password123")
    assert_not user.authenticate("wrong-password")
  end
end
