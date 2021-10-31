require "test_helper"

class DesigualControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get desigual_index_url
    assert_response :success
  end
end
