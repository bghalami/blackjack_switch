class User < ApplicationRecord
  validates_presence_of :username, :password_digest, :chip_count
end
