class TechStack < ActiveRecord::Base
  has_many :tech_taggings, dependent: :destroy
  has_many :tagged_organizations, through: :tech_taggings, source: :organization

  validates :title, presence: true, uniqueness: { message: "This technology already exists" }
end
