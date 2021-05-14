FactoryBot.define do
  factory :user do
    nickname              {'test'}
    last_name_kanji       {'てすと'}
    first_name_kanji      {'てすと'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスト'}
    birthday              {'19930928'}


    email                 {Faker::Internet.email}
    password              {'123abc'}
    password_confirmation {password}
  end
end