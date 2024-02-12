require "test_helper"

class Public::LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_links_index_url
    assert_response :success
  end
end
