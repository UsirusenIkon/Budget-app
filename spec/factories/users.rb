require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Internet.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
  trait :confirmed do
    confirmed_at { Time.now }
  end
end
