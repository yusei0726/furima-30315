FactoryBot.define do
  factory :purchase_form do
    postal_code     { '123-4567' }
    prefecture_id   { 10 }
    municiparity    { '東京都港区' }
    house_number    { '旭町1-23-4' }
    building_name   { '朝日ビル' }
    phone_number    { '08012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
