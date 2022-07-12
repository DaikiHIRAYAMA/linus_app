require 'test_helper'

class TestOrderControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get test_order_create_url
    assert_response :success
  end

  test "should get index" do
    get test_order_index_url
    assert_response :success
  end

end
