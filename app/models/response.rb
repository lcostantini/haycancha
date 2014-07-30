class Response < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  after_create :set_state!

  def set_state!
    self.state = :waiting
    save
  end

end