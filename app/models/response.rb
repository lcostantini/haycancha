class Response < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  scope :waiting, ->{ where(state: :waiting) }

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

end