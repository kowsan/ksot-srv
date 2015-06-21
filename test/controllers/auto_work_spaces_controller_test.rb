require 'test_helper'

class AutoWorkSpacesControllerTest < ActionController::TestCase
  setup do
    @auto_work_space = auto_work_spaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auto_work_spaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auto_work_space" do
    assert_difference('AutoWorkSpace.count') do
      post :create, auto_work_space: {  }
    end

    assert_redirected_to auto_work_space_path(assigns(:auto_work_space))
  end

  test "should show auto_work_space" do
    get :show, id: @auto_work_space
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auto_work_space
    assert_response :success
  end

  test "should update auto_work_space" do
    patch :update, id: @auto_work_space, auto_work_space: {  }
    assert_redirected_to auto_work_space_path(assigns(:auto_work_space))
  end

  test "should destroy auto_work_space" do
    assert_difference('AutoWorkSpace.count', -1) do
      delete :destroy, id: @auto_work_space
    end

    assert_redirected_to auto_work_spaces_path
  end
end
