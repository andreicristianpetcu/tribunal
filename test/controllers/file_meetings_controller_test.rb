require 'test_helper'

class FileMeetingsControllerTest < ActionController::TestCase
  setup do
    @file_meeting = file_meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_meeting" do
    assert_difference('FileMeeting.count') do
      post :create, file_meeting: { case_type: @file_meeting.case_type, date: @file_meeting.date, hour: @file_meeting.hour, number: @file_meeting.number, old_number: @file_meeting.old_number, trial_status: @file_meeting.trial_status }
    end

    assert_redirected_to file_meeting_path(assigns(:file_meeting))
  end

  test "should show file_meeting" do
    get :show, id: @file_meeting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_meeting
    assert_response :success
  end

  test "should update file_meeting" do
    patch :update, id: @file_meeting, file_meeting: { case_type: @file_meeting.case_type, date: @file_meeting.date, hour: @file_meeting.hour, number: @file_meeting.number, old_number: @file_meeting.old_number, trial_status: @file_meeting.trial_status }
    assert_redirected_to file_meeting_path(assigns(:file_meeting))
  end

  test "should destroy file_meeting" do
    assert_difference('FileMeeting.count', -1) do
      delete :destroy, id: @file_meeting
    end

    assert_redirected_to file_meetings_path
  end
end
