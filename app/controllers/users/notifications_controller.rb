class Users::NotificationsController < Users::ApplicationController

  def index
    @notifications = current_user.notifications.waiting
    #@count_notifications = @notifications.length
  end

  def new
    @notification = Notification.new team_id: params[:team_id]
  end

  def create
    @notification = Notification.new(notification_params)
    respond_to do |format|
      if @notification.save
        format.html { redirect_to users_teams_path }
      else
        format.html { render :new }
      end
    end
  end

  def accept
    Notification.find(params[:notification_id]).accept!
    redirect_to users_notifications_path
  end

  def cancel
    Notification.find(params[:notification_id]).cancel!
    redirect_to users_notifications_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:user_id, :team_id, :state, :email)
    end
end
