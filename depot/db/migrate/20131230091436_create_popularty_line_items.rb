class CreatePopulartyLineItems < ActiveRecord::Migration
  def change
    create_table :popularty_line_items do |t|
      t.integer :product_id
      t.integer :popularty_id

      t.timestamps
    end
  end
end
