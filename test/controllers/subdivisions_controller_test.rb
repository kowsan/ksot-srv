require 'test_helper'

class SubdivisionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @subdivision = subdivisions(:one)
    login_as_admin
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subdivisions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subdivision" do
    assert_difference('Subdivision.count') do
      post :create, subdivision: {name: 'sd1', area_id: areas(:one).id}
    end

    assert_redirected_to subdivision_path(assigns(:subdivision))
  end

  test "should show subdivision" do
    get :show, id: @subdivision
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subdivision
    assert_response :success
  end

  test "should update subdivision" do
    patch :update, id: @subdivision, subdivision: {:short_name => '123'}
    assert_redirected_to subdivisions_path
  end

  test "should destroy subdivision" do
    assert_difference('Subdivision.count', -1) do
      delete :destroy, id: @subdivision
    end

    assert_redirected_to subdivisions_path
  end
end
