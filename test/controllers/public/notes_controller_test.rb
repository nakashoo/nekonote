require "test_helper"

class Public::NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_notes_index_url
    assert_response :success
  end
end
