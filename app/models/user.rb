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

  def user_responses
    responses.waiting
  end

  def events_state(event)
    responses.where(event: event).first.state
  end

  def responses_last
    [responses.last]
  end

  def notifications_waiting
    notifications.waiting
  end

  def responses_vigente
    events.vigente
  end

end