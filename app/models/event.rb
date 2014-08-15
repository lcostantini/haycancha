class Event < ActiveRecord::Base
  belongs_to :team
  has_many :responses
  has_many :users, through: :responses

  scope :future, -> { where('created_for > ?', Time.now) }
  scope :coming_soon, -> { where(created_for: Date.today..2.weeks.from_now) }

  after_create :send_invitation!

  def send_invitation!
    team.users.each do |user|
      responses.create user: user
      send_email(user)
    end
  end

  def send_email(user)
    UserMailer.waiting_email(self, user).deliver
  end

end