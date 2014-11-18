require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'Creates User' do
    get(:create, {user: {name: 'Bob', email: 'bob@bob.com', password: 'bob', password_confirmation: 'bob', date_of_birth:'1982/5/4'}})
    assert_redirected_to user_path(User.find_by_email('bob@bob.com'))
  end

end
