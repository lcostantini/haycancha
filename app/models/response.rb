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

  def responses_waiting
    Event.vigente.each do |event|
      event.responses.waiting.each do |response|
        UserMailer.waiting_email(event, response.user).deliver
      end
    end
  end

  def not_response?
    state == 'accepted' || state == 'canceled'
  end

end