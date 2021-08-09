class AddSaleToWishlist < ActiveRecord::Migration[6.1]
  def change
    add_column :wishlists, :on_sale, :integer
  end
end
