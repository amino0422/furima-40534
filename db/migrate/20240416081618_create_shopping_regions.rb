class CreateShoppingRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_regions do |t|
      t.string     :title , null: false
      t.timestamps
    end
  end
end