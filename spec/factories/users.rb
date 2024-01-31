FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {"鈴木"}
    first_name            {"一朗"}
    last_name_hurigana    {"スズキ"}
    first_name_hurigana   {"イチロウ"}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65) }


  end
end