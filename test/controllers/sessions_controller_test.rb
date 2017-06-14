require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get New" do
    get sessions_New_url
    assert_response :success
  end

end
