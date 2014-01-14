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
    description 'description' * 3
    start_date '07/11/2013'
    end_date '30/11/2013'
    adress 'lviv, vul. Pasternaka,5'
    longitude 49.8327337
    latitude 49.8327337
    virtual false
  end

  factory :article do
    title 'about'
    content 'about article'
    add_to_menu true
  end

  factory :biography do
    name 'biography'
    description 'description'
    user_id 1
  end

  factory :markdown_image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'uploads', 'markdown_image', 'glyphicons-halflings.png')) }
  end

  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
  end
end
