require 'test_helper'

class TrialProceedingsControllerTest < ActionController::TestCase
  setup do
    @trial_proceeding = trial_proceedings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trial_proceedings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trial_proceeding" do
    assert_difference('TrialProceeding.count') do
      post :create, trial_proceeding: {  }
    end

    assert_redirected_to trial_proceeding_path(assigns(:trial_proceeding))
  end

  test "should show trial_proceeding" do
    get :show, id: @trial_proceeding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trial_proceeding
    assert_response :success
  end

  test "should update trial_proceeding" do
    patch :update, id: @trial_proceeding, trial_proceeding: {  }
    assert_redirected_to trial_proceeding_path(assigns(:trial_proceeding))
  end

  test "should destroy trial_proceeding" do
    assert_difference('TrialProceeding.count', -1) do
      delete :destroy, id: @trial_proceeding
    end

    assert_redirected_to trial_proceedings_path
  end
end
