# rake db:setup

@user_admin = User.create(email: 'admin@example.com', password: 'helloworld', password_confirmation: 'helloworld', admin: true)
@user_moderator = User.create(email: 'user@example.com', password: 'helloworld', password_confirmation: 'helloworld', admin: false)

5.times do |i|
  Tag.create(name: "tag#{i}")
end

30.times do |n|
  Exhibit.create(name: "Scout hat-#{n}",
                 registration_number: "170488#{n}",
                 description: 'Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant (Loxodonta africana) and the Asian elephant (Elephas maximus), although some evidence suggests that African bush elephants and African forest elephants are separate species (L. africana and L. cyclotis respectively). Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia. Elephantidae are the only surviving family of the order proboscidea; other, now extinct, families of the order include mammoths and mastodons. ',
                 user_id: @user_moderator.id)
end

30.times do |t|
  Exhibition.create(name: "Exhibition of scout hats-#{t}",
                  description: 'Everything what is not relevant to elephant is irrelephant.',
                  start_date: '20-11-2013',
                  end_date: '21-11-2013',
                  virtual: false,
                  adress: 'Lviv',
                  user_id: @user_moderator.id)
end

Property.create(title:'title', value:'My scout Museum')

Article.create(title:'Контакти',
               content:' **Зелений Іван Іванович**<br>
                Народився 12 лютого 1993 року у м. Львові у сім’ї вчителів.
                 З раннього віку любив грати в настільні ігри,
                подорожувати.У семирічному *віці* почав грати на гітарі.
                <br><br>блаблаблаблаблаблаблаблаблаблаблабла.Народився 12
                лютого 1993 року у м. Львові
                у сім’ї вчителів. З раннього віку любив грати в настільні ігри,
                 подорожувати.
                У семирічному *віці* почав грати на гітарі.
                 блаблаблаблаблаблаблаблаблаблаблабла<br><br><br></div>
                 **Червоний Іван Іванович** <br><br>
                 Народився 12 лютого 1993 року у м. Львові у сім’ї вчителів.
                  З раннього віку любив грати в настільні ігри,
                подорожуватию У семирічному віці почав грати на гітарі.
                блаблаблаблаблаблаблаблаблаблаблабла.<br><br><br>
                **Синій Іван Іванович**<br><br>
                Народився 12 лютого 1993 року у м. Львові у сім’ї вчителів.
                З раннього віку любив грати в настільні ігри, подорожуватию
                У семирічному віці почав грати на гітарі.
                блаблаблаблаблаблаблаблаблаблаблабла.',
                add_to_menu: true)
Article.create(title:'Допомога',
               content: ' Шановні гості та користувачі сайту! Нагадуємо Вам, що ПЛАСТ -
                 організація неприбуткова, тож нам необхідна Ваша підтримка. Якщо Ви
                 зацікавились нашою діяльністю, і хочете бути свідками того, що наш
                 музей активно розвивається, закликаємо Вас зробити пожертву на нашу
                 користь
                 Цю важливу місію Ви можете здійснити двома шляхами:
                 Поповнити наш гаманець Web-money:
                 UI-2545665247785865
                 Здійснити оплату у відділенні будь-якого українського банку за такими
                 реквізитами:
                 ЄДРПОУ 12254565
                 ПЛАСТ
                 р/р: 1255786655778987
                 Вельми вдячні.
                 Дай Бог Вам здоров’я!',
                 add_to_menu: true)

Property.create(title:'welcome', value:'You are welcome!')
