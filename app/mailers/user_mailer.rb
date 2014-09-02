class UserMailer < ActionMailer::Base
  default from: "haycancha@gmail.com"

  def invited_email(user, current_user)
    @current_user_email = current_user.email
    @url = ENV["URL_EMAIL"]
    mail(to: user.email, subject: 'Invitation to HayCancha')
  end

  def waiting_email(event, user)
    @event = event
    @user = user
    @url = ENV["URL_EMAIL"]
    mail(to: @user.email, subject: 'Reminder for a Event')
  end

end
