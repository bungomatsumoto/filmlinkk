FactoryBot.define do
  factory :right_holder do
    name { "上映権を持つ人" }
    email { "rrr@gmail.com" }
    password { "rrrrrr" }
    confirmed_at { Time.now }
  end
end
