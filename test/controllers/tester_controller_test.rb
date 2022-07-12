require 'test_helper'

class TesterControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tester_create_url
    assert_response :success
  end

  test "should get index" do
    get tester_index_url
    assert_response :success
  end

  test "should get show" do
    get tester_show_url
    assert_response :success
  end

  test "should get new" do
    get tester_new_url
    assert_response :success
  end

  test "should get edit" do
    get tester_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get tester_destroy_url
    assert_response :success
  end

  test "should get update" do
    get tester_update_url
    assert_response :success
  end

end
