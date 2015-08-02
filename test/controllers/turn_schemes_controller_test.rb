require 'test_helper'

class TurnSchemesControllerTest < ActionController::TestCase
  setup do
    @turn_scheme = turn_schemes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turn_schemes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turn_scheme" do
    assert_difference('TurnScheme.count') do
      post :create, turn_scheme: {  }
    end

    assert_redirected_to turn_scheme_path(assigns(:turn_scheme))
  end

  test "should show turn_scheme" do
    get :show, id: @turn_scheme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turn_scheme
    assert_response :success
  end

  test "should update turn_scheme" do
    patch :update, id: @turn_scheme, turn_scheme: {  }
    assert_redirected_to turn_scheme_path(assigns(:turn_scheme))
  end

  test "should destroy turn_scheme" do
    assert_difference('TurnScheme.count', -1) do
      delete :destroy, id: @turn_scheme
    end

    assert_redirected_to turn_schemes_path
  end
end
