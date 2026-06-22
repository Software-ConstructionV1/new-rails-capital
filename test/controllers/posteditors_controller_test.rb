require "test_helper"

class PosteditorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posteditor = posteditors(:one)
  end

  test "should get index" do
    get posteditors_url
    assert_response :success
  end

  test "should get new" do
    get new_posteditor_url
    assert_response :success
  end

  test "should create posteditor" do
    assert_difference("Posteditor.count") do
      post posteditors_url, params: { posteditor: { editor_id: @posteditor.editor_id, user_id: @posteditor.user_id } }
    end

    assert_redirected_to posteditor_url(Posteditor.last)
  end

  test "should show posteditor" do
    get posteditor_url(@posteditor)
    assert_response :success
  end

  test "should get edit" do
    get edit_posteditor_url(@posteditor)
    assert_response :success
  end

  test "should update posteditor" do
    patch posteditor_url(@posteditor), params: { posteditor: { editor_id: @posteditor.editor_id, user_id: @posteditor.user_id } }
    assert_redirected_to posteditor_url(@posteditor)
  end

  test "should destroy posteditor" do
    assert_difference("Posteditor.count", -1) do
      delete posteditor_url(@posteditor)
    end

    assert_redirected_to posteditors_url
  end
end
