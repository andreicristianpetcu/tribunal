require 'test_helper'

class CourtsControllerTest < ActionController::TestCase
  setup do
    @trial_court = courts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create court" do
    assert_difference('Court.count') do
      post :create, court: {  }
    end

    assert_redirected_to court_path(assigns(:court))
  end

  test "should show court" do
    get :show, id: @trial_court
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trial_court
    assert_response :success
  end

  test "should update court" do
    patch :update, id: @trial_court, court: {  }
    assert_redirected_to court_path(assigns(:court))
  end

  test "should destroy court" do
    assert_difference('Court.count', -1) do
      delete :destroy, id: @trial_court
    end

    assert_redirected_to courts_path
  end
end
