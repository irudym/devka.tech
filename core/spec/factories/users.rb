FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    nickname { Faker::Books::Dune.character}
    email { 'foo@bar.com' }
    password { 'foobar' }
  end
end