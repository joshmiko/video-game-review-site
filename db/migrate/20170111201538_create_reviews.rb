class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string   :body,       null: false
      t.integer  :game_id,    null: false
      t.integer  :user_id,    null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string   :username,   null: false
      t.string   :title,      null: false
    end
  end
end
