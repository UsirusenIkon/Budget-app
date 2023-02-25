require 'faker'

FactoryBot.define do
  factory :group do
    name { "Test Group" }
    association :user # creates a User record and associates it with the group
  end  
end

