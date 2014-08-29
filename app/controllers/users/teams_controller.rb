class Users::TeamsController < Users::ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    current_user.teams << @team
    if @team.save
      redirect_to users_home_welcome_path, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to users_home_welcome_path, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @team.users.delete(User.find_by(id: current_user))
    redirect_to users_home_welcome_path, notice: 'Left the team successfully.'
  end

  private
    def set_team
      @team = current_user.teams.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :avatar)
    end
end
