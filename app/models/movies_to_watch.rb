class MoviesToWatch < ApplicationRecord
  belongs_to :movie
  belongs_to :watchlist_movies
end
