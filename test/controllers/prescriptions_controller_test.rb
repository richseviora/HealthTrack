require 'test_helper'

class PrescriptionsControllerTest < ActionController::TestCase
  test 'creates a prescription' do
    get(:create,{user_id: User.first.id, prescription: {name: 'Whatever',date_issued: Date.new(2014,10,10)}}, {user_id: User.first.id})
    assert_redirected_to user_path(User.first.id)
  end

  test 'rejects invalid users' do
    get(:create,{user_id: -1, prescription: {name: 'Whatever',date_issued: Date.new(2014,10,10)}}, {user_id: -1})
    assert_redirected_to sessions_path
  end
end
