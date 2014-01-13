# rake db:setup


@user_admin = User.create(email: 'admin@example.com', password: 'helloworld', password_confirmation: 'helloworld', admin: true)
@user_moderator = User.create(email: 'user@example.com', password: 'helloworld', password_confirmation: 'helloworld', admin: false)


30.times do |n|
  exhibit = Exhibit.new(name: "Scout hat-#{n}",
                        registration_number: "170488#{n}",
                        description: 'Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant (Loxodonta africana) and the Asian elephant (Elephas maximus), although some evidence suggests that African bush elephants and African forest elephants are separate species (L. africana and L. cyclotis respectively). Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia. Elephantidae are the only surviving family of the order proboscidea; other, now extinct, families of the order include mammoths and mastodons. ',
                        user_id: @user_moderator.id)
  exhibit.versions.each {|v| v.update_attribute('whodunnit', @user_moderator.id)}

  # Comment out for broken assets - temporalry
  exhibit.pictures.build(image: File.new("#{Rails.root}/db/seed/image1.jpg"))

  exhibit.tags.build(name: "tag#{n}")
  exhibit.save
end

exhibit = Exhibit.create(name: "Audio",
                         registration_number: "170488",
                         tags_string: "audio",
                         iframe: ' <iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/106046114&amp;color=ff6600&amp;auto_play=false&amp;show_artwork=true"></iframe>',
                         description: 'Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant (Loxodonta africana) and the Asian elephant (Elephas maximus), although some evidence suggests that African bush elephants and African forest elephants are separate species (L. africana and L. cyclotis respectively). Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia. Elephantidae are the only surviving family of the order proboscidea; other, now extinct, families of the order include mammoths and mastodons. ',
                         user_id: @user_moderator.id)
exhibit = Exhibit.create(name: "Video",
                         registration_number: "170488",
                         tags_string: "video",
                         iframe: '<iframe width="480" height="360" src="//www.youtube.com/embed/NhZDrJBCe60" frameborder="0" allowfullscreen></iframe>',
                         description: 'Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant (Loxodonta africana) and the Asian elephant (Elephas maximus), although some evidence suggests that African bush elephants and African forest elephants are separate species (L. africana and L. cyclotis respectively). Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia. Elephantidae are the only surviving family of the order proboscidea; other, now extinct, families of the order include mammoths and mastodons. ',
                         user_id: @user_moderator.id)
5.times do |n|
  u = Picture.new
  u.image  = File.open(File.join(Rails.root, 'db', 'seed', 'image1.jpg'))
  u.exhibit_id = 1
  u.save!
end

exhibit = Exhibit.create(name: "Audio",
                         registration_number: "170488",
                         tags_string: "audio",
                         iframe: ' <iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/106046114&amp;color=ff6600&amp;auto_play=false&amp;show_artwork=true"></iframe>',
                         description: 'Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant (Loxodonta africana) and the Asian elephant (Elephas maximus), although some evidence suggests that African bush elephants and African forest elephants are separate species (L. africana and L. cyclotis respectively). Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia. Elephantidae are the only surviving family of the order proboscidea; other, now extinct, families of the order include mammoths and mastodons. ',
                         user_id: @user_moderator.id)
exhibit = Exhibit.create(name: "Video",
                         registration_number: "170488",
                         tags_string: "video",
                         iframe: '<iframe width="480" height="360" src="//www.youtube.com/embed/NhZDrJBCe60" frameborder="0" allowfullscreen></iframe>',
                         description: 'Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant (Loxodonta africana) and the Asian elephant (Elephas maximus), although some evidence suggests that African bush elephants and African forest elephants are separate species (L. africana and L. cyclotis respectively). Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia. Elephantidae are the only surviving family of the order proboscidea; other, now extinct, families of the order include mammoths and mastodons. ',
                         user_id: @user_moderator.id)

5.times do |n|
  u = Picture.new
  u.image  = File.open(File.join(Rails.root, 'db', 'seed', 'image1.jpg'))
  u.exhibit_id = 1
  u.save!
end

30.times do |t|
  exhibition = Exhibition.create(name: "Exhibition of scout hats-#{t}",
                                 description: 'Everything what is not relevant to elephant is irrelephant.',
                                 start_date: '20-11-2013',
                                 end_date: '21-11-2013',
                                 virtual: false,
                                 adress: 'Lviv',
                                 user_id: @user_moderator.id)
  exhibition.versions.each {|v| v.update_attribute('whodunnit', @user_moderator.id)}
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
Article.create(title:'Звернення крайового проводу Пласту в Україні до членства з приводу участі в громадських акціях щодо євроінтеграції',
               content: ' Сьогодні, у такий складний для України час її цивілізаційного вибору, керівництво Пласту – Національної скаутської організації України всіляко вітає та підтримує громадську активність нашого дорослого членства у відстоюванні своїх прав.
  Нам надзвичайно приємно, що серед перших активістів, які вийшли на підтримку курсу європейської інтеграції України був старший пластун скоб, вихованець кіровоградського Пласту, журналіст 5 каналу Сашко Аргат, а багато інших старших пластунів та сеньйорів організовували і брали участь у акціях вже з перших годин їх проведення. Це вкотре показує, що методика самовиховання активних громадян своєї країни, яка використовується у нашій організації вже понад 100 років, дає свої результати.

  Ми свідомі того, що все більше членів нашої організації вже приступили до активних дій і підтримуємо їх у цьому. Разом з тим, мусимо наголосити про недопустимість участі у масових акціях неповнолітніх дітей без відповідного дозволу чи особистої присутності їхніх батьків. Всі дорослі члени організації мають повну підтримку проводу у їх праві висловлювати власну позицію у будь-якій дозволеній законодавством України формі.

  Для більш безпечної участі в різних акціях, закликаємо наших дорослих членів консолідуватися і самоорганізовуватися у більші групи чи то на базі структури Пласту (курені, станиці) чи у будь-якій інший зручний спосіб. Ми не вважаємо за доцільне використання будь-якої пластової символіки на громадських акціях, оскільки їх мета не продемонструвати активність тієї чи іншої організації, а лише єдність суспільства у виборі європейського напрямку розвитку. Тому вітаємо використання національної та європейської символіки.

  Україна потребує нашої допомогти, як людей, які вміють працювати у групах, планувати та проводити заходи, розраховані на велику кількість людей. Україна потребує ініціативних, активних громадян, які будуть здатні висловити свою підтримку її розвитку.

  Ми закликаємо дорослих членів організації діяти так, як їм велить Пластовий Закон та Присяга.

  Крайова пластова рада
  22.11.2013',
               add_to_menu: false)

Property.create(title:'mainPageTags', value:'tag0,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9, tag10,tag11')
