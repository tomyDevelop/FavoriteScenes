require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get profiles_create_url
    assert_response :success
  end

  test "should get —-skip-routes" do
    get profiles_—-skip-routes_url
    assert_response :success
  end
end
