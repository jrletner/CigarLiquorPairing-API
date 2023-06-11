# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# *** USERS ***
(0..10).each do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "password")
end

# *** CIGARS ***
(0..20).each do |i|
  faker_name = Faker::Hacker.noun.capitalize + " " + Faker::Hacker.verb.capitalize
  faker_brand = Faker::Hacker.noun.capitalize + " " + Faker::Hacker.verb.capitalize
  faker_description = Faker::Lorem.sentence

  cigar = Cigar.new(user_id: rand(1..12), name: faker_name, brand: faker_brand, description: faker_description, image_path: "https://www.searchenginejournal.com/wp-content/uploads/2022/06/image-search-1600-x-840-px-62c6dc4ff1eee-sej.png")

  cigar.save
end

# *** LIQUORS ***
(0..20).each do |i|
  faker_name = Faker::Hacker.noun.capitalize + " " + Faker::Hacker.verb.capitalize
  faker_brand = Faker::Hacker.noun.capitalize + " " + Faker::Hacker.verb.capitalize
  faker_description = Faker::Lorem.sentence

  liquor = Liquor.new(user_id: rand(1..12), name: faker_name, brand: faker_brand, description: faker_description, image_path: "https://www.searchenginejournal.com/wp-content/uploads/2022/06/image-search-1600-x-840-px-62c6dc4ff1eee-sej.png")

  liquor.save
end
