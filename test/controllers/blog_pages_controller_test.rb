require 'test_helper'

class BlogPagesControllerTest < ActionController::TestCase
  setup do
    @blog_page = blog_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog_page" do
    assert_difference('BlogPage.count') do
      post :create, blog_page: { body: @blog_page.body, title: @blog_page.title }
    end

    assert_redirected_to blog_page_path(assigns(:blog_page))
  end

  test "should show blog_page" do
    get :show, id: @blog_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog_page
    assert_response :success
  end

  test "should update blog_page" do
    patch :update, id: @blog_page, blog_page: { body: @blog_page.body, title: @blog_page.title }
    assert_redirected_to blog_page_path(assigns(:blog_page))
  end

  test "should destroy blog_page" do
    assert_difference('BlogPage.count', -1) do
      delete :destroy, id: @blog_page
    end

    assert_redirected_to blog_pages_path
  end
end
