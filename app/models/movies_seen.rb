class MoviesSeen < ApplicationRecord
  belongs_to :movie
  belongs_to :movies_seen_list
end
