FactoryBot.define do
  factory :purchase_record_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code      { '123-4567' }
    prefecture_id  { 2 }
    city           { '東京都' }
    street_address { '1-1' }
    building_name   { '東京ハイツ' }
    phone_number   { '12345678910' }
  end
end