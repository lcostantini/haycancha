class Response < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  scope :waiting, -> { where(state: :waiting) }

  before_create :set_state!

  def set_state!
    self.state = :waiting
  end

  def accept!
    self.state = :accepted
    save
  end

  def cancel!
    self.state = :canceled
    save
  end

  def expired!
    self.state = :expired
    save
  end

  def responses_waiting
    Event.future.each do |event|
      event.responses.waiting.each do |response|
        UserMailer.waiting_email(event, response.user).deliver
      end
    end
  end

  def waiting?
    if state == 'waiting'
      Event.future.where(id: event_id).any?
    end
  end

  def accepted?
    state == 'accepted'
  end

  def can_accepted?
    waiting? || state == 'canceled'
  end

  def can_canceled?
    waiting? || state == 'accepted'
  end

  def team_name
    event.team.name
  end

end