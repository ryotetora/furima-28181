FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a'+ Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"阿部"}
    last_name             {"貞夫"}
    first_name_kana       {"アベ"}
    last_name_kana        {"サダオ"}
    birthday              { "2020-01-01" }

  end
end
