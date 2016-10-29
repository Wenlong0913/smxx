require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get product_list_url
    assert_response :success
  end

  test "should get show" do
    get product_show_url
    assert_response :success
  end

  test "should get cart" do
    get product_cart_url
    assert_response :success
  end

  test "should get order" do
    get product_order_url
    assert_response :success
  end

  test "should get pay" do
    get product_pay_url
    assert_response :success
  end

  test "should get add_address" do
    get product_add_address_url
    assert_response :success
  end

  test "should get address_list" do
    get product_address_list_url
    assert_response :success
  end

  test "should get qrcode" do
    get product_qrcode_url
    assert_response :success
  end

end
