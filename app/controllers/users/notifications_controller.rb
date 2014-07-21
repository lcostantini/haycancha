class Users::NotificationsController < ApplicationController
  layout "users/layouts/application"

  def index
    @notifications = current_user.notifications.all
    @count = @notifications.length
  end

  def new
    @notification = Notification.new
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to users_notifications_path, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
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
