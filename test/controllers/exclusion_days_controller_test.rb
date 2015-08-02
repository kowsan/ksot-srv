require 'test_helper'

class ExclusionDaysControllerTest < ActionController::TestCase
  setup do
    @exclusion_day = exclusion_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exclusion_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exclusion_day" do
    assert_difference('ExclusionDay.count') do
      post :create, exclusion_day: { day: @exclusion_day.day }
    end

    assert_redirected_to exclusion_day_path(assigns(:exclusion_day))
  end

  test "should show exclusion_day" do
    get :show, id: @exclusion_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exclusion_day
    assert_response :success
  end

  test "should update exclusion_day" do
    patch :update, id: @exclusion_day, exclusion_day: { day: @exclusion_day.day }
    assert_redirected_to exclusion_day_path(assigns(:exclusion_day))
  end

  test "should destroy exclusion_day" do
    assert_difference('ExclusionDay.count', -1) do
      delete :destroy, id: @exclusion_day
    end

    assert_redirected_to exclusion_days_path
  end
end
