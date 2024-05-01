class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region, class_name: 'Region'
  belongs_to :user
  belongs_to :item
  has_one :shopping_address

  attr_accessor :token
end