class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  scope :waiting, ->{where(state: :waiting)}

  validates :user, presence: true

  def self.start user, team
    Notification.create({user: user, team: team, state: :waiting})
  end

  def accept!
    self.state = :accepted
    join_team
    join_event
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

  #delegate :email, to: :user, allow_nil: true, prefix: false

  def email
    user.email if user
  end

  def join_event
    return unless team.events.last
    team.events.last.responses.create user: user
  end

  def not_response?
    notification.state == 'accepted' || notification.state == 'canceled'
  end

end
