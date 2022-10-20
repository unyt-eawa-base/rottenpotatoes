class AddUniqueIndexOnEmailToMoviegoers < ActiveRecord::Migration[7.0]
  def change
    add_index :moviegoers, :email, unique: true
  end
end
