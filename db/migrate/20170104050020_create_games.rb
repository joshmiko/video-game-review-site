class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :developer, null: false
      t.string :comments, null: false
      t.string :genre, null: false
    end
  end
end
