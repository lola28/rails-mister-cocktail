# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "🧹 Cleaning the ingredients table..."
Ingredient.destroy_all
Cocktail.destroy_all

puts "🌎 Fetching ingredients from thecocktaildb..."

# Parse the JSON from thecocktaildb
# Copyright © 2019 Mark Swaringen. All rights reserved
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
url_serialized = open(url).read

ingredients = JSON.parse(
  url_serialized,
  symbolize_names: true
)

ingredients[:drinks].each do |ingredient|
  puts "* #{ingredient[:strIngredient1]}"

  Ingredient.create(name: ingredient[:strIngredient1])
end

puts "🍸 Done!"
