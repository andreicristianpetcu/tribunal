require 'test_helper'

class ProceedingsControllerTest < ActionController::TestCase
  setup do
    @proceeding = proceedings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proceedings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proceeding" do
    assert_difference('Proceeding.count') do
      post :create, proceeding: {  }
    end

    assert_redirected_to proceeding_path(assigns(:proceeding))
  end

  test "should show proceeding" do
    get :show, id: @proceeding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proceeding
    assert_response :success
  end

  test "should update proceeding" do
    patch :update, id: @proceeding, proceeding: {  }
    assert_redirected_to proceeding_path(assigns(:proceeding))
  end

  test "should destroy proceeding" do
    assert_difference('Proceeding.count', -1) do
      delete :destroy, id: @proceeding
    end

    assert_redirected_to proceedings_path
  end
end
