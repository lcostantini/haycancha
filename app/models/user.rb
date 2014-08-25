class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_attached_file :avatar, :styles => { :medium => "70x70>", :thumb => "30x30>" }, :default_url => "missing-user.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :teams
  has_many :notifications
  has_many :responses
  has_many :events, through: :responses

  def total_notifications
    notifications.waiting.count + responses_waiting.count
  end

  def responses_waiting
    events_future_waiting.compact
  end

  def events_future_waiting
    events.future.map do |event|
      event.responses.where(user: self, state: :waiting).first
    end
  end

  def events_state(event)
    responses.where(event: event).first.state
  end

  def notifications_waiting
    notifications.waiting
  end

  def events_future
    events.future
  end

  def responses_two_week_future
    events.coming_soon.map do |event|
      event.responses.where(user: self).first
    end
  end

  def events_expired_waiting
    events.expired.map do |event|
      if events_state(event) == 'waiting'
        responses.where(event: event).first.expired!
      end
    end
  end

  def email_equal_to(team_user)
    email == team_user.email
  end
  
end