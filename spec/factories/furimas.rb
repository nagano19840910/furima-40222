FactoryBot.define do
  factory :furima do
    product_name { Faker::Commerce.product_name }
    product_description { Faker::Commerce.product_name }
    category_id {2}
    product_condition_id {2}
    shipping_burden_id {2}
    prefecture_id {2}
    shipping_day_id {2}
    price { 1000 }

    association :user
    
    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end