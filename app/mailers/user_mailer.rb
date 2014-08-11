class UserMailer < ActionMailer::Base
  default from: "no-reply@haycancha.com"

  def invited_email(user, current_user)
    @current_user_email = current_user.email
    @url = 'http://localhost:3000/'
    mail(to: user.email, subject: 'Invitation to HayCancha')
  end

  def waiting_email(event, user)
    @event = event
    @user = user
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Reminder for a Event')
  end

end
