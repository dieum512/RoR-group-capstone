# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
  User.create(
    name: Faker::Name.name,
  )
end

50.times do
  Recipe.create(
    name: Faker::Lorem.sentence(word_count: 2),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    user: User.all.sample,
    preparation_time: Faker::Number.between(from: 1, to: 10),
    cooking_time: Faker::Number.between(from: 1, to: 10),
    public: Faker::Boolean.boolean(true_ratio: 0.2)
  )
end

50.times do
  Food.create(
    name: Faker::Lorem.sentence(word_count: 2),
    user: User.all.sample,
    measurement_unit:Faker::Measurement.volume(amount: "none"),
    price: Faker::Number.between(from: 1, to: 100),
    quantity: Faker::Number.between(from: 1, to: 10),
  )
end

50.times do
  RecipeFood.create(
    recipe: Recipe.all.sample,
    food: Food.all.sample,
    quantity: Faker::Number.between(from: 1, to: 10),
  )
end

puts  "#{Food.count} foods, #{Recipe.count} recipes, #{User.count} users and #{RecipeFood.count} recipes food are successfully created"
