require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  test "user notifications" do
    assert @team.users.include? (@user)
  end
end
