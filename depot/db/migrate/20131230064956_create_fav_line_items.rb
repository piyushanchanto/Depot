class CreateFavLineItems < ActiveRecord::Migration
  def change
    create_table :fav_line_items do |t|
      t.integer :product_id
      t.integer :fav_id

      t.timestamps
    end
  end
end
