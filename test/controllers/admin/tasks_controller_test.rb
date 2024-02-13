require "test_helper"

class Admin::TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_tasks_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_tasks_edit_url
    assert_response :success
  end
end
