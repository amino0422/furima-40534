class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string      :product            , null: false
      t.integer     :price              , null: false
      t.text        :seller_comment     , null: false
      t.integer     :category_id        , null: false
      t.integer     :condition_id       , null: false
      t.integer     :postage_type_id    , null: false
      t.integer     :shopping_region_id , null: false
      t.integer     :shopping_date_id   , null: false
      t.timestamps
    end
  end
end
