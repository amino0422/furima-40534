class CreateShoppingDates < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_dates do |t|
      t.string     :title , null: false
      t.timestamps
    end
  end
end