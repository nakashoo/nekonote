require "test_helper"

class Admin::ToDoListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_to_do_lists_index_url
    assert_response :success
  end
end
