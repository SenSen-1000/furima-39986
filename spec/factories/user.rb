FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    encrypted_password    {password}
    family_name           {'山田'}
    first_name            {'太郎'}
    read_family_name      {'ヤマダ'}
    read_first_name       {'タロウ'}
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end