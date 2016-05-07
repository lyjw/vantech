class CreateTechStacks < ActiveRecord::Migration
  def change
    create_table :tech_stacks do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
