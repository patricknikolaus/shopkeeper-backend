class CreateWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlists do |t|
      t.string :user_id
      t.string :game_id
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end
end
