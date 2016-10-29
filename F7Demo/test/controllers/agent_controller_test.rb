require 'test_helper'

class AgentControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get agent_homepage_url
    assert_response :success
  end

  test "should get products" do
    get agent_products_url
    assert_response :success
  end

  test "should get events" do
    get agent_events_url
    assert_response :success
  end

  test "should get comments" do
    get agent_comments_url
    assert_response :success
  end

  test "should get qrcode" do
    get agent_qrcode_url
    assert_response :success
  end

end
