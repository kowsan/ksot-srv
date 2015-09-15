require 'test_helper'

class ControlListMonthsControllerTest < ActionController::TestCase
  setup do
    @control_list_month = control_list_months(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_list_months)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_list_month" do
    assert_difference('ControlListMonth.count') do
      post :create, control_list_month: { form_date: @control_list_month.form_date }
    end

    assert_redirected_to control_list_month_path(assigns(:control_list_month))
  end

  test "should show control_list_month" do
    get :show, id: @control_list_month
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @control_list_month
    assert_response :success
  end

  test "should update control_list_month" do
    patch :update, id: @control_list_month, control_list_month: { form_date: @control_list_month.form_date }
    assert_redirected_to control_list_month_path(assigns(:control_list_month))
  end

  test "should destroy control_list_month" do
    assert_difference('ControlListMonth.count', -1) do
      delete :destroy, id: @control_list_month
    end

    assert_redirected_to control_list_months_path
  end
end
