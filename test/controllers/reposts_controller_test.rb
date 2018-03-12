require 'test_helper'

class RepostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reposts_index_url
    assert_response :success
  end

  test "should get new" do
    get reposts_new_url
    assert_response :success
  end

end
