class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.date :release_date
      t.string :language
      t.integer :duration

      t.timestamps
    end
  end
end
