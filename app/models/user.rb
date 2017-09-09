class User < ApplicationRecord
  has_secure_password
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :favorites
  has_many :gifs, through: :favorites

  enum role: %w(default admin)

  def favorite(gif)
    gifs << gif
  end

  def unfavorite(gif)
    gifs.delete(gif)
  end
end
