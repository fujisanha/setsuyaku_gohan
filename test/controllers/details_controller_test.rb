require "test_helper"

class DetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get details_destroy_url
    assert_response :success
  end
end
