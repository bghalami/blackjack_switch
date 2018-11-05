class User < ApplicationRecord
  require 'securerandom'

  has_many :user_games
  has_many :games, through: :user_games

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, :chip_count, :api_key

  has_secure_password

  def assign_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
