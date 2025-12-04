class AddColumnPosterToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :poster, :string
  end
end
