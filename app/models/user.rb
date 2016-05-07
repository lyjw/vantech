class User < ActiveRecord::Base
  belongs_to :organization

  has_many :pending_requests
  has_many :pending_organization, through: :pending_requests, source: :organization
end
