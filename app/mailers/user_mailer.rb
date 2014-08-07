class UserMailer < ActionMailer::Base
  default from: "no-reply@haycancha.com"

  def invited_email(user, current_user)
    binding.pry
    @current_user_email = current_user.email
    @url  = 'http://localhost:3000/'
    mail(to: user.email, subject: 'Invitation to HayCancha')
  end

end
