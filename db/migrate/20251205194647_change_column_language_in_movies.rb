class ChangeColumnLanguageInMovies < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :language, :string
    add_column :movies, :languages, :string, array: true, default: []
    add_column :movies, :year, :string
  end
end
