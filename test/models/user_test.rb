require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "example@prash.com", student_id: 123456, username: "conbonbot", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name shouldn't be longer than 50 characters" do
    @user.name = ("a" * 51)
    assert_not @user.valid?
  end

  test "email should be legit" do
    @user.email = "hey"
    assert_not @user.valid?
    @user.email = "woah@there"
    assert_not @user.valid?
    @user.email = "woah@there,hey"
    assert_not @user.valid?
    @user.email = "woah@there.hey"
    assert @user.valid?
  end

  test "email should exist" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should be shorter than 256 characters" do
    @user.email = ("a" * 256)
    assert_not @user.valid?
  end

  test "email should be unique" do
    dup = @user.dup
    dup.email = @user.email.upcase
    @user.save
    assert_not dup.valid?
  end

  test "student id should be legit (and 6 characters)" do
    @user.student_id = 5
    assert_not @user.valid?
    @user.student_id = "1234f6"
    assert_not @user.valid?
    @user.student_id = "1234567"
    assert_not @user.valid?
    @user.student_id = "abcdef"
    assert_not @user.valid?
    @user.student_id = "123456"
    assert @user.valid?
  end
  
  test "username should exist" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should be less than 256 characters" do
    @user.username = ("a" * 256)
    assert_not @user.valid?
  end

  test "password should be at least 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
