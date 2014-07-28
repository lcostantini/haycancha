require 'test_helper'

class NotificationTest < ActiveSupport::TestCase

  def setup
    @user = User.create({email: 'qwe@qwe.com', password: 'password'})
    @team = Team.create({name: 'my team'})
    @notification = Notification.new({user_id: 1, team_id: 11, state: :waiting})
  end

  test 'user notifications' do
    notification = Notification.start(@user, @team)
    notification.accept!
    assert @team.users.include?(@user)
  end

  test 'accepted' do
    notification = Notification.start(@user, @team)
    notification.accept!
    assert_equal notification.state, :accepted
  end

  test 'canceled' do
    notification = Notification.start(@user, @team)
    notification.cancel!
    assert_equal notification.state, :canceled
  end

  test 'waiting' do
    notification = Notification.start(@user, @team)
    assert_equal notification.state, :waiting
  end

  test 'associates user when passing an email' do
    notification = Notification.new team: @team
    notification.email = 'qwe@qwe.com'
    notification.save
    assert notification.user
  end

end
