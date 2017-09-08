class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string :search_term
      t.string :image_path
      t.references :category, foreign_key: true, index: true
    end
  end
end
