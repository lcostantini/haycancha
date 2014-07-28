class Users::NotificationsController < ApplicationController
  layout "users/layouts/application"

  def index
    @notifications = current_user.notifications.all
    @count = @notifications.length
  end

  def new
    @notification = Notification.new team_id: params[:team_id]
  end

  def create
    @notification = current_user.notifications.build(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to users_teams_path }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:user_id, :team_id, :state)
    end
end
