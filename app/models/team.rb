class Team < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "70x70>", :thumb => "30x30>" }, :default_url => "missing-team.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_and_belongs_to_many :users
  has_many :events
end