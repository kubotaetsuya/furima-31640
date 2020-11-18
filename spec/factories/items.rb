FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials(number: 2) }
    image                 { Faker::Lorem.sentence }
    description           { 'これはテストコードです' }
    category_id           { '2' }
    status_id             { '2' }
    shipping_fee_burden_id { '2' }
    shipping_area_id { '2' }
    days_ship_id { '2' }
    price { '400' }
    association :user
  end
end
