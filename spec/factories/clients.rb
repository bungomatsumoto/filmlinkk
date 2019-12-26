FactoryBot.define do
  factory :client do
    name { "映画を探す人" }
    email { "ccc@gmail.com" }
    password { "cccccc" }
    confirmed_at { Time.now }
  end
end
