require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should log in" do
    get(:create,user: {email: 'richard@seviora.com', password: 'password'})
    assert_redirected_to user_path(User.find_by_email('richard@seviora.com'))
  end

  test "should reject wrong password" do
    get(:create,user: {email: 'richard@seviora.com', password: 'not my password'})
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_redirected_to new_sessions_path
  end

end
