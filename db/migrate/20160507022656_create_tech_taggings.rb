class CreateTechTaggings < ActiveRecord::Migration
  def change
    create_table :tech_taggings do |t|
      t.references :organization, index: true, foreign_key: true
      t.references :tech_stack, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
