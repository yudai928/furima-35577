FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id { 1 }
    city { '横浜市緑区' }
    house_number { '青山1-1-1' }
    building_name { '柳ビル100'}
    telephone_number { '12345678910' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

