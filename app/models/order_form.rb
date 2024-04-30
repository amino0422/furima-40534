class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :token, :post_code, :region_id, :city, :street_address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Input correctly" }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid." }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(post_code: post_code, region_id: region_id, city: city, street_address: street_address, building: building, phone_number: phone_number, order_id: order.id)
  end
end