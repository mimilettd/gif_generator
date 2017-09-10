class Category < ApplicationRecord
  has_many :gifs, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def sample_gif
    unless self.gifs.empty?
      gif = Gif.where(category_id: self)
      gif.first.image_path
    end
  end
end
