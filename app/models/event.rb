class Event < ActiveRecord::Base
  belongs_to :team
  has_many :responses
  has_many :users, through: :responses
end