# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Product.destroy_all
Review.destroy_all

john = User.create!(
  password: 'secret',
  email: 'john@gmail.com',
  expert: true
)

5.times do
  white_wine = Product.create!(
    name: 'Vin du jura',
    description: 'Excellent vin',
    category: 'vin blanc',
    origin: 'jura',
    price: rand(10..30),
    image_url: '/assets/vin_jaune.jpg',
    rate: rand(2..5)
  )

  red_wine = Product.create!(
    name: 'Vin du jura',
    description: 'Excellent vin',
    category: 'vin rouge',
    origin: 'bordeaux',
    price: rand(10..30),
    image_url: '/assets/red_wine.jpg',
    rate: rand(2..5)
  )

  rose_wine = Product.create!(
    name: 'Rosé de provence',
    description: 'Excellent vin',
    category: 'vin rosé',
    origin: 'languedoc',
    price: rand(10..30),
    image_url: '/assets/rose_wine.jpg',
    rate: rand(2..5)
  )

  5.times do
    review = Review.create!(
      rate: rand(1..5),
      user: john,
      product: white_wine
    )
    review2 = Review.create!(
      rate: rand(1..5),
      user: john,
      product: red_wine
    )

    review3 = Review.create!(
      rate: rand(1..5),
      user: john,
      product: rose_wine
    )
  end
end
