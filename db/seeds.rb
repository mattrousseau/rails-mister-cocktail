# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

puts "Destroy all"

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts "Create Cocktails"
c1 = Cocktail.create(name: "Mojito")
c2 = Cocktail.create(name: "Bloody Mary")
c3 = Cocktail.create(name: "Caipirina")

p Cocktail.all

puts "Create Ingredients"
i1 = Ingredient.create(name: "Rhum")
i2 = Ingredient.create(name: "Vodka")
i3 = Ingredient.create(name: "Whisky")
i4 = Ingredient.create(name: "lemon")
i5 = Ingredient.create(name: "ice")
i6 = Ingredient.create(name: "mint leaves")

ingredient["drinks"].each do |key, value|
  # p key["strIngredient1"]
  # p value
  p Ingredient.create(name: "#{key["strIngredient1"]}")
end

p Ingredient.all

puts "Create Doses"
Dose.create(cocktail: c1, ingredient: i1, description: "6cl")
Dose.create(cocktail: c1, ingredient: i4, description: "Half")
Dose.create(cocktail: c1, ingredient: i5, description: "1 scoop")
Dose.create(cocktail: c1, ingredient: i6, description: "20gr")
Dose.create(cocktail: c1, ingredient: i1, description: "8cl")
Dose.create(cocktail: c2, ingredient: i2, description: "10cl")

p Dose.all
