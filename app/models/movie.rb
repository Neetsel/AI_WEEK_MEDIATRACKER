class Movie < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :planned_movies, dependent: :destroy
  has_many :seen_movies, dependent: :destroy
  has_many :chats, dependent: :destroy
end
