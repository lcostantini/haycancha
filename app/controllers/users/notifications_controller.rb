class Users::NotificationsController < Users::ApplicationController

  def index
    current_user.events_expired_waiting
    @notifications = current_user.notifications.waiting
  end

  def new
    @notification = Notification.new team_id: params[:team_id]
  end

  def create
    @notification = Notification.new(notification_params)
    respond_to do |format|
      if @notification.save
        UserMailer.invited_email(@notification.user, current_user).deliver
        format.html { redirect_to users_home_welcome_path, notice: 'Player was successfully invited.' }
      else
        format.html { render :new }
      end
    end
  end

  def accept
    Notification.find(params[:notification_id]).accept!
    redirect_to :back
  end

  def cancel
    Notification.find(params[:notification_id]).cancel!
    redirect_to :back
  end

  private
    def notification_params
      params.require(:notification).permit(:user_id, :team_id, :state, :email)
    end
end
