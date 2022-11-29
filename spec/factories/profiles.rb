FactoryBot.define do
  factory :profile do
    title { Faker::Coffee.blend_name }
    description { Faker::Hipster.paragraph_by_chars(characters: 255) }
  end
end
