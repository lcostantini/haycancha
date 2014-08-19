class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :teams
  has_many :notifications
  has_many :responses
  has_many :events, through: :responses

  def total_notifications
    notifications.waiting.count + responses.waiting.count
  end

  def responses_waiting
    responses.waiting
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
  
end