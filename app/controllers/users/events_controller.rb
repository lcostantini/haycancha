class Users::EventsController < Users::ApplicationController
  before_action :set_event

  def index
    @team = Team.find(params[:team_id])
    @events = @team.events
  end

  def new
    @event = Event.new team_id: params[:team_id]
  end

  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to users_teams_path }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :team_id, :created_for)
  end

end