require "test_helper"

class Admin::NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_notes_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_notes_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_notes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_notes_edit_url
    assert_response :success
  end
end
