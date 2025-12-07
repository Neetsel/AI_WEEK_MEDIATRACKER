class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  has_many :messages, dependent: :destroy
  has_many :likes, through: :users
  has_many :planned_movies, through: :users
  has_many :seen_movies, through: :users
end
