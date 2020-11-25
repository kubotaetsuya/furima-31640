FactoryBot.define do
  factory :order_address do

    postcode {"123-1234"}
    shipping_area_id {"2"}
    city {"栃木市栃木区"}
    block {"青山1-1-1"}
    building {"角角ハイツ"}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end