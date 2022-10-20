class CreateMoviegoers < ActiveRecord::Migration[7.0]
  def change
    create_table :moviegoers do |t|
      t.string :name
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end
