class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  attr_accessor :email

  before_save :associate_user

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
    team.users << user
  end

  def associate_user
    self.user ||= User.find_by_email email
  end

end
