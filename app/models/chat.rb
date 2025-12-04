class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  has_many :messages, dependent: :destroy
end
