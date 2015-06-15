require 'test_helper'


class WorkSpacesControllerTest < ActionController::TestCase
  include Devise::TestHelpers


  setup do

    @work_space = work_spaces(:one)
  end

  test "should get index" do
    login_as_admin
    get :index

    assert_response :success
    assert_not_nil assigns(:work_spaces)
  end

  test "should get new" do
    login_as_admin
    get :new
    assert_response :success
  end

  test "should create work_space" do
    login_as_admin
    assert_difference('WorkSpace.count') do
      post :create, work_space: {:name => 'ws1', :subdivision_id => subdivisions(:one).id}
    end

    assert_redirected_to work_space_path(assigns(:work_space))
  end

  test "should show work_space" do
    login_as_admin
    get :show, id: @work_space
    assert_response :success
  end

  test "should get edit" do
    login_as_admin
    get :edit, id: @work_space
    assert_response :success
  end

  test "should update work_space" do
    login_as_admin
    patch :update, id: @work_space, work_space: {:short_name => 'xxx'}
    assert_redirected_to work_spaces_path
  end

  test "should destroy work_space" do
    login_as_admin
    assert_difference('WorkSpace.count', -1) do
      delete :destroy, id: @work_space
    end

    assert_redirected_to work_spaces_path
  end
end
