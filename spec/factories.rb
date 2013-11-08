FactoryGirl.define do
  factory :user do
    email 'default_user@example.com'
    password 'helloworld'
    password_confirmation 'helloworld'
    admin true
  end


  factory :exhibit do
    name 'exhibit'
    registration_number '435446'
    description 'dsfgdfgdfhg'
  end
end
