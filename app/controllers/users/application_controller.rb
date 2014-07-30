class Users::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout "users/layouts/application"

  before_action :authenticate_user!

  def count_notifications
    @count_notifications = current_user.notifications.waiting.count
  end

end
