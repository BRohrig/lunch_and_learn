class User < ApplicationRecord
  has_many :favorites
  validates_presence_of :email, :name, :api_key
  validates_uniqueness_of :email

  def create_api_key
    self.api_key = SecureRandom.hex
  end
end
