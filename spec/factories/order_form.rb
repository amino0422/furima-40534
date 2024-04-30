FactoryBot.define do
  factory :order_form do
    token { "tok_abcdefghijk00000000000000000" }
    post_code { "123-4567" }
    region_id { 2 }
    city { "市区町村" }
    street_address { "番地" }
    building { "建物名" }
    phone_number { "09012345678" }
    user_id { 1 }
    item_id { 1 }
  end
end