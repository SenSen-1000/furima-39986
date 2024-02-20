FactoryBot.define do
  factory :item do
    item_name            {Faker::Lorem.sentence}
    item_explanation     {Faker::Lorem.sentence}
    category             {Category.all.sample}
    condition            {Condition.all.sample}
    delivery_charge_load {DeliveryChargeLoad.all.sample}
    prefecture           {Prefecture.all.sample}
    number_of_day        {NumberOfDay.all.sample}
    price                {Faker::Number.between(from: 300, to: 9999999)}
    image                { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/sample_image.jpg"), 'image/jpeg') }
    association :user 
  end
end
