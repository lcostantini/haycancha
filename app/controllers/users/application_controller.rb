class Users::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout "users/layouts/application"

  before_action :authenticate_user!

  def total_notifications
    @count_notifications = current_user.notifications.waiting.count
    @count_responses = current_user.responses.waiting.count
    @total_notifications = @count_notifications + @count_responses
  end

  def user_responses
    @responses = current_user.responses.waiting
  end

end
