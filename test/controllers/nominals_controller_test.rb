require "test_helper"

class NominalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nominals_new_url
    assert_response :success
  end

  test "should get create" do
    get nominals_create_url
    assert_response :success
  end

  test "should get show" do
    get nominals_show_url
    assert_response :success
  end
end
