FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Name.initials}
    first_name            {Faker::Name.initials}
    last_name_hurigana    {Faker::Name.initials}
    first_name_hurigana   {Faker::Name.initials}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end