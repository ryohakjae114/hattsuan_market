20.times do
  name = Faker::Lorem.paragraph_by_chars(number: rand(5..100))
  description = Faker::Lorem.paragraph_by_chars(number: rand(20..200))
  price_without_tax = rand(0..200_000)
  Product.create!(name:, price_without_tax:, description:)
end
