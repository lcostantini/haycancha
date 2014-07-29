class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  scope :waiting, ->{where(state: :waiting)}

  validates :user, presence: true

  def self.start user, team
    @notification = Notification.create({user: user, team: team, state: :waiting})
  end

  def accept!
    self.state = :accepted
    join_team
    save
  end

  def cancel!
    self.state = :canceled
    save
  end

  def join_team
    team.users << user
  end

  def email= email
    self.user = User.find_by_email email
  end

  def email
    user.email if user
  end

end
