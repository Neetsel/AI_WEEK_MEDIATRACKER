class CreateMoviesToWatches < ActiveRecord::Migration[7.1]
  def change
    create_table :movies_to_watches do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :watchlist_movies, null: false, foreign_key: true

      t.timestamps
    end
  end
end
