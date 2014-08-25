class Users::TeamsController < Users::ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    current_user.teams << @team

    respond_to do |format|
      if @team.save
        format.html { redirect_to users_home_welcome_path, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to users_home_welcome_path, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.users.delete(User.find_by(id: current_user))
    respond_to do |format|
      format.html { redirect_to users_home_welcome_path, notice: 'Left the team successfully.' }
      format.json { head :no_content }
    end
  end

  private
    def set_team
      @team = current_user.teams.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :avatar)
    end
end
