require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | Project Stardust"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Project Stardust"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Project Stardust"
  end

end
