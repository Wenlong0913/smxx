require 'test_helper'

class UnuserControllerTest < ActionDispatch::IntegrationTest
  test "should get invite_register" do
    get unuser_invite_register_url
    assert_response :success
  end

  test "should get no_invite_register" do
    get unuser_no_invite_register_url
    assert_response :success
  end

end
