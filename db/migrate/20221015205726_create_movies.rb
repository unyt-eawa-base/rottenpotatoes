class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string 'title'
      t.string 'rating'
      t.datetime 'release_date'
      t.timestamps
    end
  end
end
