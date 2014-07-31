class Users::ResponsesController < Users::ApplicationController

  def index
    @responses = current_user.responses.waiting
  end

  def new
    @response = Response.new
  end

  def create
    @response = Response.new(response_params)
    @response.save
  end

  def accept
    Response.find(params[:response_id]).accept!
    redirect_to users_notifications_path
  end

  def cancel
    Response.find(params[:response_id]).cancel!
    redirect_to users_notifications_path
  end

  private
    def set_response
      @response = Response.find(params[:id])
    end

    def response_params
      params.require(:response).permit(:event_id, :user_id, :state)
    end
end
