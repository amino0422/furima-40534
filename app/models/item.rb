class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_type
  belongs_to :region
  belongs_to :shopping_date
  belongs_to :user

  has_one_attached :image
  has_one :order

  validates :image, :product, :seller_comment, :category, :condition, :postage_type, :region, :shopping_date, presence: true

  validates :category_id, :condition_id, :postage_type_id, :region_id, :shopping_date_id, numericality: { other_than: 1 }

  validates :product, length: { maximum: 40 }

  validates :seller_comment, length: { maximum: 1000 }

  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true}, presence: true
end