20.times do |index|
  Client.create(
    name: "クライアント#{index}",
    email: "client#{index}@gmail.com",
    password: "password#{index}",
    screen_name: "screen#{index}",
    country: "country#{index}",
    city: "city#{index}",
    intro: "イントロダクション#{index}"*10,
    icon: open("#{Rails.root}/db/fixtures/img3.jpg"))
end

10.times do |index|
  right_holders = RightHolder.create(
    name: "著作権者#{index}",
    email: "right_holder#{index}@gmail.com",
    password: "password#{index}",
    intro: "イントロダクション#{index}"*10,
    icon: open("#{Rails.root}/db/fixtures/img3.jpg"))
end

10.times do |index|
  title = Faker::Job.title
  explanation = "Hogehoge"

  Film.create(
    right_holder_id: RightHolder.find(index+1).id,
    title: title,
    intro: intro,
    director: intro,
    image: open("#{Rails.root}/db/fixtures/img3.jpg"),
    production_year: intro,
    production_country: intro,
    running_time: intro,
    cast: intro,
    genre: intro)
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
