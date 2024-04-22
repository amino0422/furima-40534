FactoryBot.define do
  factory :item do
    product { "Example product" }
    price { 500 }
    seller_comment { "This is a comment" }
    category_id { 1 }
    condition_id { 1 }
    postage_type_id { 1 }
    region_id { 1 }
    shopping_date_id  { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end