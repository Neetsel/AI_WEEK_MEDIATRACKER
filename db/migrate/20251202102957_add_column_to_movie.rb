class AddColumnToMovie < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :genres, :string, array: true, default: []
    add_column :movies, :tags, :string, array: true, default: []
    add_column :movies, :countries, :string, array: true, default: []
    add_column :movies, :directors, :string, array: true, default: []
    add_column :movies, :writers, :string, array: true, default: []
    add_column :movies, :producers, :string, array: true, default: []
    add_column :movies, :cast, :string, array: true, default: []
    add_column :movies, :composers, :string, array: true, default: []
    add_column :movies, :studios, :string, array: true, default: []
  end
end
