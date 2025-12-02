class AddColumnToMoviesSeen < ActiveRecord::Migration[7.1]
  def change
    add_column :movies_seens, :dates_consumed, :date, array: true, default: []
  end
end
