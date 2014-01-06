class CreatePopularties < ActiveRecord::Migration
  def change
    create_table :popularties do |t|

      t.timestamps
    end
  end
end
