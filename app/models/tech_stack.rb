class TechStack < ActiveRecord::Base
  has_many :tech_taggings, dependent: :destroy
  has_many :tagged_organizations, through: :tech_taggings, source: :organization
end
