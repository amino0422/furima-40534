FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    last_name_kana        {Faker::Name.last_name.chars.map!{['ァ','イ','ウ','エ','オ'].sample}.join}
    first_name_kana       {Faker::Name.first_name.chars.map!{['ア','イ','ウ','エ','オ'].sample}.join}
    birth_date            {Faker::Date.birthday}
  end
end