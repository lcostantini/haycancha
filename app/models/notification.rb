class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  def self.start(user, team)
    @notification = Notification.create({user: user, team: team, state: :waiting})
  end

  def accept
    self.state = :accepted
    join_team
    save
  end

  def canceled
    self.state = :canceled
    save
  end

  def join_team
    team.users.push(user)
  end
end
