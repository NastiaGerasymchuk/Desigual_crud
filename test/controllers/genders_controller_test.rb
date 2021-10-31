require "test_helper"

class GendersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get genders_show_url
    assert_response :success
  end

  test "should get init" do
    get genders_init_url
    assert_response :success
  end

  test "should get new" do
    get genders_new_url
    assert_response :success
  end
end
