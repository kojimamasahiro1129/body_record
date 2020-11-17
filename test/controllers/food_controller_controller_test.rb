require 'test_helper'

class FoodControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get food_controller_edit_url
    assert_response :success
  end

  test "should get update" do
    get food_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get food_controller_destroy_url
    assert_response :success
  end

end
