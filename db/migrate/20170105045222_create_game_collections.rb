class CreateGameCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :game_collections do |t|
      t.integer :user_id, null: false
      t.integer :game_id, null: false
      t.date :published
      t.timestamps
    end
  end
end
