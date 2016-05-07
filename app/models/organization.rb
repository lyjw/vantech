class Organization < ActiveRecord::Base
  has_many :tech_taggings, dependent: :destroy
  has_many :tech_stacks, through: :tech_taggings


end
