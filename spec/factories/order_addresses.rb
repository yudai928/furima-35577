FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id { 1 }
    city { '横浜市緑区' }
    house_number { '青山1-1-1' }
    telephone_number { 12_345_678_910 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
