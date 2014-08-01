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
    count_notifications = notifications.waiting.count
    count_responses = responses.waiting.count
    count_notifications + count_responses
  end

  def user_responses
    responses.waiting
  end

  def events_state(event)
    responses.where(event: event).first.state
  end

end