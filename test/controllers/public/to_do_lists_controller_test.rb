require "test_helper"

class Public::ToDoListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_to_do_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get public_to_do_lists_show_url
    assert_response :success
  end
end
