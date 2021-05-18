FactoryBot.define do
  factory :item do
    name { 'てすと' }
    price { 300 }
    description             { 'てすと' }
    category_id             { 2 }
    condition_id            { 2 }
    shipping_rate_id        { 2 }
    shipping_area_id        { 2 }
    shipping_day_id         { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
