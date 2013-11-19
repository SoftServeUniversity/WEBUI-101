require 'faker'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password 'helloworld'
    password_confirmation 'helloworld'
    admin true
  end


  factory :exhibit do
    name 'exhibit'
    registration_number '435446'
    description 'dsfgdfgdfhg'
  end

  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
  end
end
