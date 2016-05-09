class Organization < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'

  mount_uploaders :images, ImageUploader

  has_many :tech_taggings, dependent: :destroy
  has_many :tech_stacks, through: :tech_taggings

  belongs_to :user

  has_many :pending_requests
  has_many :pending_mangers, through: :pending_requests, source: :user

  mount_uploader :logo, LogoUploader
end
