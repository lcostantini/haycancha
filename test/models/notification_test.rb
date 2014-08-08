require 'test_helper'

class NotificationTest < ActiveSupport::TestCase

  def setup
    @user = User.create({email: 'user@user.com', password: 'password'})
    @team = Team.create({name: 'my team'})
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
    notification.email = 'user@user.com'
    notification.save
    assert notification.user
  end

  test 'invite a player to a team and a event previously created' do
    event = Event.create({name: 'Marangoni', team: @team, created_for: '2020-08-06 23:00:00'})
    notification = Notification.create({ user: @user, team: @team })
    notification.accept!
    assert @user.events.include? event
  end

end
