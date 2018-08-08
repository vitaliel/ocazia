require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "welcome page" do
    get "/"
    assert_response(:success)
  end
end
