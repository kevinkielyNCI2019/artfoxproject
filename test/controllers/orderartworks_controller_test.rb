require 'test_helper'

class OrderartworksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orderartworks_index_url
    assert_response :success
  end

  test "should get show" do
    get orderartworks_show_url
    assert_response :success
  end

  test "should get new" do
    get orderartworks_new_url
    assert_response :success
  end

  test "should get edit" do
    get orderartworks_edit_url
    assert_response :success
  end

end
