require 'test_helper'

class NotificationTest < ActiveSupport::TestCase

  def setup
    @user = User.new({email: 'qwe@qwe.com', password: 'password'})
    @team = Team.new
  end

  test 'user notifications' do
    notification = Notification.start(@user, @team)
    notification.accept
    assert @team.users.include?(@user)
  end

  test 'accepted' do
    notification = Notification.start(@user, @team)
    notification.accept
    assert_equal notification.state, :accepted
  end

  test 'canceled' do
    notification = Notification.start(@user, @team)
    notification.canceled
    assert_equal notification.state, :canceled
  end

  test 'waiting' do
    notification = Notification.start(@user, @team)
    assert_equal notification.state, :waiting
  end
end
