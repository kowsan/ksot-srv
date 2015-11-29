require 'test_helper'

class ControlListQuartersControllerTest < ActionController::TestCase
  setup do
    @control_list_quarter = control_list_quarters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_list_quarters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_list_quarter" do
    assert_difference('ControlListQuarter.count') do
      post :create, control_list_quarter: { author_id: @control_list_quarter.author_id, form_date: @control_list_quarter.form_date, subdivision_id: @control_list_quarter.subdivision_id }
    end

    assert_redirected_to control_list_quarter_path(assigns(:control_list_quarter))
  end

  test "should show control_list_quarter" do
    get :show, id: @control_list_quarter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @control_list_quarter
    assert_response :success
  end

  test "should update control_list_quarter" do
    patch :update, id: @control_list_quarter, control_list_quarter: { author_id: @control_list_quarter.author_id, form_date: @control_list_quarter.form_date, subdivision_id: @control_list_quarter.subdivision_id }
    assert_redirected_to control_list_quarter_path(assigns(:control_list_quarter))
  end

  test "should destroy control_list_quarter" do
    assert_difference('ControlListQuarter.count', -1) do
      delete :destroy, id: @control_list_quarter
    end

    assert_redirected_to control_list_quarters_path
  end
end
