require 'test_helper'

class WorkControllerTest < ActionController::TestCase
  test "should get app_login" do
    get :app_login
    assert_response :success
  end

  test "should get app_logout" do
    get :app_logout
    assert_response :success
  end

end
