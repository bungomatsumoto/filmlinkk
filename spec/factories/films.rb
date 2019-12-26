FactoryBot.define do
  factory :film do
    title { "film1" }
    intro { "filmintro1" }
    director { "filmdirector1" }
    image { "filmimage1" }
    production_year { 2000 }
    production_country { "filmcountry1" }
    running_time { 110 }
    cast { "filmcast1" }
    genre { "filmgenre1" }
  end
end
