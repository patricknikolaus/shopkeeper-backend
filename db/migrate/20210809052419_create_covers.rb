class CreateCovers < ActiveRecord::Migration[6.1]
  def change
    create_table :covers do |t|
      t.string :image
      t.integer :igdb_id

      t.timestamps
    end
  end
end
