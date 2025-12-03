class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :planned_movies, dependent: :destroy
  has_many :seen_movies, dependent: :destroy
  has_many :chats, dependent: :destroy
end
