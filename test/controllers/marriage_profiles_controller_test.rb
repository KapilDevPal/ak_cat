require "test_helper"

class MarriageProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get marriage_profiles_index_url
    assert_response :success
  end

  test "should get show" do
    get marriage_profiles_show_url
    assert_response :success
  end

  test "should get new" do
    get marriage_profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get marriage_profiles_create_url
    assert_response :success
  end

  test "should get edit" do
    get marriage_profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get marriage_profiles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get marriage_profiles_destroy_url
    assert_response :success
  end
end
