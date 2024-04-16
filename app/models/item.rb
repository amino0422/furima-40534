class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_type
  belongs_to :shopping_region
  belongs_to :shopping_date

  validates :category, :condition, :postage_type, :shopping_region, :shopping_date, presence: true

  validates :category_id, :condition_id, :postage_type_id, :shopping_region_id, :shopping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

end