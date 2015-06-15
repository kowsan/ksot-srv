require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    login_as_admin
    @user = users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {first_name: 'Sanya', login: 'AK', last_name: 'ln',
                           subdivision_id: subdivisions(:one).id, staff_role_id: staff_roles(:admin).id}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: {}
    assert_redirected_to users_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
