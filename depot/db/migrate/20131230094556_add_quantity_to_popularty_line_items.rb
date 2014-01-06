class AddQuantityToPopulartyLineItems < ActiveRecord::Migration
  def change
    add_column :popularty_line_items, :quantity, :integer, default: 1
  end
end
