require "test_helper"

class Public::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_members_index_url
    assert_response :success
  end
end
