class Event < ActiveRecord::Base
  belongs_to :team
  has_many :responses
  has_many :users, through: :responses

  after_create :send_invitation!

  def send_invitation!
    team.users.each do |user|
      responses.create user: user
    end
  end

end