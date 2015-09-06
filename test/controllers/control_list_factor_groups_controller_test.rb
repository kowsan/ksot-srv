require 'test_helper'

class ControlListFactorGroupsControllerTest < ActionController::TestCase
  setup do
    @control_list_factor_group = control_list_factor_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_list_factor_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_list_factor_group" do
    assert_difference('ControlListFactorGroup.count') do
      post :create, control_list_factor_group: { name: @control_list_factor_group.name, order_num: @control_list_factor_group.order_num }
    end

    assert_redirected_to control_list_factor_group_path(assigns(:control_list_factor_group))
  end

  test "should show control_list_factor_group" do
    get :show, id: @control_list_factor_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @control_list_factor_group
    assert_response :success
  end

  test "should update control_list_factor_group" do
    patch :update, id: @control_list_factor_group, control_list_factor_group: { name: @control_list_factor_group.name, order_num: @control_list_factor_group.order_num }
    assert_redirected_to control_list_factor_group_path(assigns(:control_list_factor_group))
  end

  test "should destroy control_list_factor_group" do
    assert_difference('ControlListFactorGroup.count', -1) do
      delete :destroy, id: @control_list_factor_group
    end

    assert_redirected_to control_list_factor_groups_path
  end
end
