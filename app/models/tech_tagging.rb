class TechTagging < ActiveRecord::Base
  belongs_to :organization
  belongs_to :tech_stack
end
