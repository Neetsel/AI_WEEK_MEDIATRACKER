class Movie < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :planned_movies, dependent: :destroy
  has_many :seen_movies, dependent: :destroy
  has_many :chats, dependent: :destroy
  validates :movie_id, uniqueness: { scope: [:release_date, :description], message: "You can't add the same movie twice." }
end
