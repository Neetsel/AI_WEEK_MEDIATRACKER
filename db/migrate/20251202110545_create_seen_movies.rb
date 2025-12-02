class CreateSeenMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :seen_movies do |t|
      t.date :consumption_date
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
