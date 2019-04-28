require 'test_helper'

class TrendingControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get trending_show_url
    assert_response :success
  end

end
