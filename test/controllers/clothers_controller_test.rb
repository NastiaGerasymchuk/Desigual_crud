require "test_helper"

class ClothersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clothers_new_url
    assert_response :success
  end

  test "should get create" do
    get clothers_create_url
    assert_response :success
  end

  test "should get show" do
    get clothers_show_url
    assert_response :success
  end
end
