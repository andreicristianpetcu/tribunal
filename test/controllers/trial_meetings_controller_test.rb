require 'test_helper'

class TrialMeetingsControllerTest < ActionController::TestCase
  setup do
    @trial_meeting = trial_meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trial_meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trial_meeting" do
    assert_difference('TrialMeeting.count') do
      post :create, trial_meeting: {  }
    end

    assert_redirected_to trial_meeting_path(assigns(:trial_meeting))
  end

  test "should show trial_meeting" do
    get :show, id: @trial_meeting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trial_meeting
    assert_response :success
  end

  test "should update trial_meeting" do
    patch :update, id: @trial_meeting, trial_meeting: {  }
    assert_redirected_to trial_meeting_path(assigns(:trial_meeting))
  end

  test "should destroy trial_meeting" do
    assert_difference('TrialMeeting.count', -1) do
      delete :destroy, id: @trial_meeting
    end

    assert_redirected_to trial_meetings_path
  end
end
