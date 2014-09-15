require 'test_helper'

class JurisprudencesControllerTest < ActionController::TestCase
  setup do
    @jurisprudence = jurisprudences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jurisprudences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jurisprudence" do
    assert_difference('Jurisprudence.count') do
      post :create, jurisprudence: {  }
    end

    assert_redirected_to jurisprudence_path(assigns(:jurisprudence))
  end

  test "should show jurisprudence" do
    get :show, id: @jurisprudence
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jurisprudence
    assert_response :success
  end

  test "should update jurisprudence" do
    patch :update, id: @jurisprudence, jurisprudence: {  }
    assert_redirected_to jurisprudence_path(assigns(:jurisprudence))
  end

  test "should destroy jurisprudence" do
    assert_difference('Jurisprudence.count', -1) do
      delete :destroy, id: @jurisprudence
    end

    assert_redirected_to jurisprudences_path
  end
end
