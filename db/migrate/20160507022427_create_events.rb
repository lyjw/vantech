class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :group_name
      t.datetime :time
      t.references :meetup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
