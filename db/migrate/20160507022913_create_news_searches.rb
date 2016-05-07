class CreateNewsSearches < ActiveRecord::Migration
  def change
    create_table :news_searches do |t|
      t.string :search_term

      t.timestamps null: false
    end
  end
end
