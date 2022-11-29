FactoryBot.define do
  factory :profile_attribute do
    profile
    key { Faker::Internet.slug(glue: '_') }
    value { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph_by_chars(characters: 255) }
    visible { true }
  end
end
