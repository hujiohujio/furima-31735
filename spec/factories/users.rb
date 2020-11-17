FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { "ss0000" }
    password_confirmation { "ss0000" }
    last_name { "山田" }
    first_name { "太郎" }
    last_name_kana { "ヤマダ"}
    first_name_kana { "タロウ" }
    birth_date { "1950-11-11" }
  end
end