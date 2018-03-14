require 'test_helper'

class PostForcesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_forces_index_url
    assert_response :success
  end

  test "should get show" do
    get post_forces_show_url
    assert_response :success
  end

end
