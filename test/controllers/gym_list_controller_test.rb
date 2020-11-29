require 'test_helper'

class GymListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gym_list_index_url
    assert_response :success
  end

  test "should get destroy" do
    get gym_list_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get gym_list_edit_url
    assert_response :success
  end

  test "should get update" do
    get gym_list_update_url
    assert_response :success
  end

end
