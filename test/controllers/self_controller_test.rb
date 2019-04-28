require 'test_helper'

class SelfControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get self_show_url
    assert_response :success
  end

  test "should get followers" do
    get self_followers_url
    assert_response :success
  end

  test "should get statistics" do
    get self_statistics_url
    assert_response :success
  end

  test "should get predictions" do
    get self_predictions_url
    assert_response :success
  end

end
