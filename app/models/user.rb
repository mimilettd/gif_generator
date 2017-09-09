class User < ApplicationRecord
  has_secure_password
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :favorites
  has_many :gifs, through: :favorites

  enum role: %w(default admin)

  def favorite_gif(gif)
    favorites << gif
  end

  def unfavorite_gif(gif)
    favorites.delete(gif)
  end
end
