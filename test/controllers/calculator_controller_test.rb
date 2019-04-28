require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get calculator_display_url
    assert_response :success
  end

end
