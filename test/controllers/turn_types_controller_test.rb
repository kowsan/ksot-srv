require 'test_helper'

class TurnTypesControllerTest < ActionController::TestCase
  setup do
    @turn_type = turn_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turn_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turn_type" do
    assert_difference('TurnType.count') do
      post :create, turn_type: {  }
    end

    assert_redirected_to turn_type_path(assigns(:turn_type))
  end

  test "should show turn_type" do
    get :show, id: @turn_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turn_type
    assert_response :success
  end

  test "should update turn_type" do
    patch :update, id: @turn_type, turn_type: {  }
    assert_redirected_to turn_type_path(assigns(:turn_type))
  end

  test "should destroy turn_type" do
    assert_difference('TurnType.count', -1) do
      delete :destroy, id: @turn_type
    end

    assert_redirected_to turn_types_path
  end
end
