require 'test_helper'

class EventPicsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_pics_create_url
    assert_response :success
  end

end
