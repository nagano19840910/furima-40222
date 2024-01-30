FactoryBot.define do
  factory :order do
    post_code { '123-4567' }
    prefecture_id { 1 }
    municipalities { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    price { 2000 }
  end
end
