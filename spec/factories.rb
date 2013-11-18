require 'faker'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password 'helloworld'
    password_confirmation 'helloworld'
    admin true
  end


  factory :exhibit do
    name 'Elephant'
    registration_number '1234'
    description 'What is not relevant to elephant is irrelephant'
    available true
  end

  factory :exhibition do
    name 'exhibition'
    description 'dsfgdfgdfhg'
    start_date '07/11/2013'
    end_date '30/11/2013'
    adress 'lviv, vul. Pasternaka,5'
    longitude 49.8327337
    latitude 49.8327337
    virtual false
  end

end
