require 'test_helper'

class ClubAdminsControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

end
