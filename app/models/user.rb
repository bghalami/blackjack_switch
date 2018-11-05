class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, :chip_count
  has_secure_password
end
