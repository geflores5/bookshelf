# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

25.times do
  Author.create([{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(18, 99)
    }])
end

50.times do
  Book.create([{
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    classification: Faker::Lorem.word,
    year: Faker::Number.number(4)
    }])
end
