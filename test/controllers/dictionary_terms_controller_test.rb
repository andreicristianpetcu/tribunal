require 'test_helper'

class DictionaryTermsControllerTest < ActionController::TestCase
  setup do
    @dictionary_term = dictionary_terms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dictionary_terms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dictionary_term" do
    assert_difference('DictionaryTerm.count') do
      post :create, dictionary_term: {  }
    end

    assert_redirected_to dictionary_term_path(assigns(:dictionary_term))
  end

  test "should show dictionary_term" do
    get :show, id: @dictionary_term
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dictionary_term
    assert_response :success
  end

  test "should update dictionary_term" do
    patch :update, id: @dictionary_term, dictionary_term: {  }
    assert_redirected_to dictionary_term_path(assigns(:dictionary_term))
  end

  test "should destroy dictionary_term" do
    assert_difference('DictionaryTerm.count', -1) do
      delete :destroy, id: @dictionary_term
    end

    assert_redirected_to dictionary_terms_path
  end
end
