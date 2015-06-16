require 'test_helper'

class CriticalTypesControllerTest < ActionController::TestCase
  setup do
    @critical_type = critical_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:critical_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create critical_type" do
    assert_difference('CriticalType.count') do
      post :create, critical_type: { name: @critical_type.name }
    end

    assert_redirected_to critical_type_path(assigns(:critical_type))
  end

  test "should show critical_type" do
    get :show, id: @critical_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @critical_type
    assert_response :success
  end

  test "should update critical_type" do
    patch :update, id: @critical_type, critical_type: { name: @critical_type.name }
    assert_redirected_to critical_type_path(assigns(:critical_type))
  end

  test "should destroy critical_type" do
    assert_difference('CriticalType.count', -1) do
      delete :destroy, id: @critical_type
    end

    assert_redirected_to critical_types_path
  end
end
