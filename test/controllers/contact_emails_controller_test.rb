require 'test_helper'

class ContactEmailsControllerTest < ActionController::TestCase
  setup do
    @contact_email = contact_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_email" do
    assert_difference('ContactEmail.count') do
      post :create, contact_email: { date: @contact_email.date, email: @contact_email.email, name: @contact_email.name }
    end

    assert_redirected_to contact_email_path(assigns(:contact_email))
  end

  test "should show contact_email" do
    get :show, id: @contact_email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_email
    assert_response :success
  end

  test "should update contact_email" do
    patch :update, id: @contact_email, contact_email: { date: @contact_email.date, email: @contact_email.email, name: @contact_email.name }
    assert_redirected_to contact_email_path(assigns(:contact_email))
  end

  test "should destroy contact_email" do
    assert_difference('ContactEmail.count', -1) do
      delete :destroy, id: @contact_email
    end

    assert_redirected_to contact_emails_path
  end
end
