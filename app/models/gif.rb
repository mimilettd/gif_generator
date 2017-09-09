class Gif < ApplicationRecord
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
