class CreateShoppingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_addresses do |t|
      t.references :order,          null: false, foreign_key: true
      t.string     :post_code,      null: false
      t.integer    :region_id,      null: false
      t.string     :city,           null: false
      t.string     :street_address, null: false
      t.string     :building
      t.string     :phone_number,   null: false
      t.timestamps
    end
  end
end