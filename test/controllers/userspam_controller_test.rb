require 'test_helper'

class UserspamControllerTest < ActionController::TestCase
  test "should get spam_all_users" do
    get :spam_all_users
    assert_response :success
  end

end
