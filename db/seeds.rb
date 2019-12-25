20.times do |index|
  Client.create!(
    name: "クライアント#{index}",
    email: "client#{index}@gmail.com",
    password: "password#{index}",
    screen_name: "screen#{index}",
    country: "country#{index}",
    city: "都市#{index}",
    intro: "イントロダクション#{index}"*10,
    icon: open("#{Rails.root}/db/fixtures/img0.png"))
end

10.times do |index|
  right_holders = RightHolder.create!(
    name: "著作権者#{index}",
    email: "right_holder#{index}@gmail.com",
    password: "password#{index}",
    intro: "イントロダクション#{index}"*10,
    icon: open("#{Rails.root}/db/fixtures/img0.png"))
end

10.times do |index|
  title = Faker::Book.title
  intro = Faker::ChuckNorris.fact
  director = Faker::Artist.name
  production_country = Faker::Address.country
  cast = Faker::BossaNova.artist
  genre = Faker::Book.genre

  Film.create!(
    right_holder_id: RightHolder.find(index+1).id,
    title: title,
    intro: intro,
    director: director,
    image: open("#{Rails.root}/db/fixtures/img#{rand(1..6)}.jpg"),
    production_year: 2000+"#{rand(10)}".to_i,
    production_country: production_country,
    running_time: 100+"#{rand(10)}".to_i,
    cast: cast,
    genre: genre)
end

Booking.create(client_id:1, film_id:3)
Booking.create(client_id:1, film_id:7)
Booking.create(client_id:3, film_id:7)
Booking.create(client_id:3, film_id:8)
Booking.create(client_id:3, film_id:10)
Booking.create(client_id:10, film_id:1)
Booking.create(client_id:18, film_id:9)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
