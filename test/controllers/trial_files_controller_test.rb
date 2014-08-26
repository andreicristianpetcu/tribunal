require 'test_helper'

class TrialFilesControllerTest < ActionController::TestCase
  setup do
    @trial_file = trial_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trial_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trial_file" do
    assert_difference('TrialFile.count') do
      post :create, trial_file: {  }
    end

    assert_redirected_to trial_file_path(assigns(:trial_file))
  end

  test "should show trial_file" do
    get :show, id: @trial_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trial_file
    assert_response :success
  end

  test "should update trial_file" do
    patch :update, id: @trial_file, trial_file: {  }
    assert_redirected_to trial_file_path(assigns(:trial_file))
  end

  test "should destroy trial_file" do
    assert_difference('TrialFile.count', -1) do
      delete :destroy, id: @trial_file
    end

    assert_redirected_to trial_files_path
  end
end
