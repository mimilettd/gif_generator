class User < ApplicationRecord
  has_secure_password
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :favorites
  has_many :gifs, through: :favorites

  enum role: %w(default admin)

  def favorite(gif)
    favorites << gif
  end

  def unfavorite(gif)
    favorites.delete(gif)
  end
end
