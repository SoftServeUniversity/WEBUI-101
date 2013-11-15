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

  factory :exhibition do
    name 'exhibition'
    description 'some description'
    start_date '11-12-2013'
    end_date '12-12-2013'
    adress 'Lviv'
  end
end
