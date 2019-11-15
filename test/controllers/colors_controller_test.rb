require 'test_helper'

class ColorsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get colors_create_url
    assert_response :success
  end

  test "should get destroy" do
    get colors_destroy_url
    assert_response :success
  end

end
