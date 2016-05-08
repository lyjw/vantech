class Organization < ActiveRecord::Base
  has_many :tech_taggings, dependent: :destroy
  has_many :tech_stacks, through: :tech_taggings

  belongs_to :user

  has_many :pending_requests
  has_many :pending_mangers, through: :pending_requests, source: :user
end
