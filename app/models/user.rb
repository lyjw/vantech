class User < ActiveRecord::Base
  has_secure_password

  belongs_to :organization

  has_many :pending_requests
  has_many :pending_organization, through: :pending_requests, source: :organization

  validates :first_name, presence: true

  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: VALID_EMAIL_REGEX
end
