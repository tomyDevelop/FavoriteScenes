require "test_helper"

class SceneCollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get scene_collections_new_url
    assert_response :success
  end

  test "should get create" do
    get scene_collections_create_url
    assert_response :success
  end
end
