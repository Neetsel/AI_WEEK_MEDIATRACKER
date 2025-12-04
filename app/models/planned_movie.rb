class PlannedMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates :user_id, uniqueness: { scope: :movie_id, message: "You can't like a movie twice." }
end
