class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :movies_name
      t.text :description
      t.string :movie_length
      t.string :actors_name
      t.string :rating

      t.timestamps
    end
  end
end
