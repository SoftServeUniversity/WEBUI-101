# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@user = User.create(email: 'admin@example.com', password: 'helloworld', password_confirmation: 'helloworld', admin: true)
User.create(email: 'user@example.com', password: 'helloworld', password_confirmation: 'helloworld', admin: false)

5.times do |i|
  Tag.create(name: "tag#{i}")
end

30.times do |n|
  exhibit = Exhibit.create(name: "Scout hat-#{n}",
                 registration_number: "170488#{n}",
                 description: 'Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant (Loxodonta africana) and the Asian elephant (Elephas maximus), although some evidence suggests that African bush elephants and African forest elephants are separate species (L. africana and L. cyclotis respectively). Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia. Elephantidae are the only surviving family of the order proboscidea; other, now extinct, families of the order include mammoths and mastodons. ',
                 user_id: @user.id)
  exhibit.versions.each {|v| v.update_attribute('whodunnit', @user.id)}
end

30.times do |t|
  exhibition = Exhibition.create(name: "Exhibition of scout hats-#{t}",
                  description: 'Everything what is not relevant to elephant is irrelephant.',
                  start_date: '20-11-2013',
                  end_date: '21-11-2013',
                  virtual: false,
                  adress: 'Lviv',
                  user_id: @user.id)
  exhibition.versions.each {|v| v.update_attribute('whodunnit', @user.id)}
end
