require 'test_helper'

class AreasControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    login_as_admin
    @area = areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area" do
    assert_difference('Area.count') do
      post :create, area: {:name => 'ar1',:management_id => managements(:one).id  }
    end

    assert_redirected_to area_path(assigns(:area))
  end

  test "should show area" do
    get :show, id: @area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area
    assert_response :success
  end

  test "should update area" do
    patch :update, id: @area, area: {  }
    assert_redirected_to area_path(assigns(:area))
  end

  test "should not destroy area" do
    assert_no_difference('Area.count') do
      delete :destroy, id: @area
    end
    assert_response :forbidden
  end
  test "should  destroy area" do
    assert_difference('Area.count',-1) do
      delete :destroy, id: areas(:three)
    end
    assert_redirected_to areas_path
  end
end
