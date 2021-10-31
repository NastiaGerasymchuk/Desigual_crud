require "test_helper"

class TrendsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get trends_new_url
    assert_response :success
  end

  test "should get create" do
    get trends_create_url
    assert_response :success
  end

  test "should get show" do
    get trends_show_url
    assert_response :success
  end
end
