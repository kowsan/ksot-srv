require 'test_helper'

class ControlListFactorsControllerTest < ActionController::TestCase
  setup do
    @control_list_factor = control_list_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_list_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_list_factor" do
    assert_difference('ControlListFactor.count') do
      post :create, control_list_factor: { comment: @control_list_factor.comment, factor: @control_list_factor.factor, is_active: @control_list_factor.is_active, order_num: @control_list_factor.order_num }
    end

    assert_redirected_to control_list_factor_path(assigns(:control_list_factor))
  end

  test "should show control_list_factor" do
    get :show, id: @control_list_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @control_list_factor
    assert_response :success
  end

  test "should update control_list_factor" do
    patch :update, id: @control_list_factor, control_list_factor: { comment: @control_list_factor.comment, factor: @control_list_factor.factor, is_active: @control_list_factor.is_active, order_num: @control_list_factor.order_num }
    assert_redirected_to control_list_factor_path(assigns(:control_list_factor))
  end

  test "should destroy control_list_factor" do
    assert_difference('ControlListFactor.count', -1) do
      delete :destroy, id: @control_list_factor
    end

    assert_redirected_to control_list_factors_path
  end
end
