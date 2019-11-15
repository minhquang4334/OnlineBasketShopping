require 'test_helper'

class SizesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sizes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sizes_destroy_url
    assert_response :success
  end

end
