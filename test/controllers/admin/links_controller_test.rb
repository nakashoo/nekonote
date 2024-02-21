require "test_helper"

class Admin::LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_links_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_links_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_links_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_links_edit_url
    assert_response :success
  end
end
