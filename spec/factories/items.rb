FactoryBot.define do
  factory :item do
    title               { Faker::Name.name }
    concept             { Faker::Lorem.sentence }
    price               { 3000 }
    category_id         { 2 }
    prefecture_id       { 2 }
    product_status_id   { 2 }
    shipping_charge_id  { 2 }
    shipping_day_id     { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
