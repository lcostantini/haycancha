require 'test_helper'

class NotificationTest < ActiveSupport::TestCase

  def setup
    @user = User.new
    @team = Team.new
  end

  test "user notifications" do
    @notification = Notification.create(@user, @team)
    @notification.accept
    assert @team.users.include? (@user)
  end
end
