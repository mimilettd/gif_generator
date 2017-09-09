class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :gif_id

      t.timestamps
    end
    add_index :favorites, :user_id
    add_index :favorites, :gif_id
    add_index :favorites, [:user_id, :gif_id], unique: true
  end
end
