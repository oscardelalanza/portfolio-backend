FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    brand { Faker::Commerce.brand }
    size { Faker::Number.number(digits: 2) }
    units { Faker::Measurement.metric_volume(amount: 'all') }
    type { Faker::Cannabis.type }
    gender { Faker::Gender.binary_type }
    category { Faker::Commerce.department(max: 1) }
    description { Faker::Lorem.paragraph(sentence_count: 5, random_sentences_to_add: 4) }
    sku { Faker::Barcode.ean }
    asin { Faker::Alphanumeric.alpha(number: 6) }
  end
end
