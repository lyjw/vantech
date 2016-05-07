class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
