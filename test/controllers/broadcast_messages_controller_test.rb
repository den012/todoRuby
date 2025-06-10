require "test_helper"

class BroadcastMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get broadcast_messages_update_url
    assert_response :success
  end
end
