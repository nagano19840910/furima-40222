FactoryBot.define do
  factory :furima do
    image { 'path/to/image.jpg' }
    product_name { Faker::Commerce.product_name }
    product_description { Faker::Commerce.product_name }
    category { Faker::Commerce.department }
    product_condition { Faker::Commerce.material }
    shipping_burden { Faker::Commerce.delivery_method }
    prefecture { Faker::Address.state }
    shipping_day { Faker::Commerce.promotion_code }
    price { Faker::Commerce.price(range: 300..9999999) }
  end
end
