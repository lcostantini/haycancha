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
  end

  def cancel
    Response.find(params[:response_id]).cancel!
  end

  private
    def response_params
      params.require(:response).permit(:event_id, :user_id, :state)
    end
end
