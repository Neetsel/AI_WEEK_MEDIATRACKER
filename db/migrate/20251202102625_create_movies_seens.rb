class CreateMoviesSeens < ActiveRecord::Migration[7.1]
  def change
    create_table :movies_seens do |t|
      t.boolean :liked
      t.references :movie, null: false, foreign_key: true
      t.references :movies_seen_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
