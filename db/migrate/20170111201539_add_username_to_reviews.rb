class AddUsernameToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :username, :string

  end
end
