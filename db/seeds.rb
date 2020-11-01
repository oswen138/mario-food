# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Food.ingredient,
    cost: Faker::Number.rand(1..30),
    country_of_origin: Faker::Address.country)

    5.times do |index|
      Review.create!(author: Faker::Name.name,
        content_body: Faker::Lorem.characters(number: rand(50..250)),
        rating: Faker::Number.rand(1..5),
        product_id: product.id)
    
        1.times do |index|
          user = User.create!(email: 'squirrels@gmail.com', password: 'squirrels', admin: false )
          admin = User.create!(email: 'cat@gmail.com', password: 'cats12', admin: true)
        end
    end
end

p "Created #{Product.count} products and #{Review.count} reviews"