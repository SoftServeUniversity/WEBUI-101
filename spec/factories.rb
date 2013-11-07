FactoryGirl.define do
  factory :user do
    email 'default_user@example.com'
    password 'helloworld'
    password_confirmation 'helloworld'
    admin true
  end
end
