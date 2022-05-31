# db/seeds.rb
puts 'Creating Restaurants'
15.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    restaurant_type: Faker::Restaurant.type,
    address: Faker::Address.full_address,
    rating: rand(1..5)
  )
end
puts 'Done Creating Restaurants'