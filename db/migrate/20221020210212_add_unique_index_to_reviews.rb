class AddUniqueIndexToReviews < ActiveRecord::Migration[7.0]
  def change
    add_index :reviews, [:movie_id, :moviegoer_id], unique: true
  end
end
