require 'test_helper'

class ResponseTest < ActiveSupport::TestCase

  def setup
    @user = User.create({email: 'user@user.com', password: 'password'})
    @team = Team.create({name: 'my team'})
  end

  test 'send email to players don´t answer event' do
    notification = Notification.create({ user: @user, team: @team })
    notification.accept!
    event = Event.create({name: 'Marangoni', team: @team, created_for: Time.now + 1.day})
    response = Response.create({event: event, user: @user})
    response.responses_waiting
    mail = ActionMailer::Base.deliveries.last
    assert_equal 'user@user.com', mail['to'].to_s
  end

end
