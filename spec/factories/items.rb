FactoryBot.define do
  factory :item do
    product { "Example product" }
    price { 500 }
    seller_comment { "This is a comment" }
    category_id { 2 }
    condition_id { 2 }
    postage_type_id { 2 }
    region_id { 2 }
    shopping_date_id  { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end