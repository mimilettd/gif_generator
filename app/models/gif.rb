class Gif < ApplicationRecord
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites


  def self.grouped_gifs
    self.all.group_by(&:search_term)
  end

  def self.surprise_gif(category_id)
    self.find_by(category_id: category_id)
  end
end
