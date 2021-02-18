# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

Ingredient.destroy_all
Cocktail.destroy_all

response = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
ingredients = JSON.parse(response)

ingredient_list = ingredients['drinks']

ingredient_list.each do |list|
  Ingredient.create(name: list['strIngredient1'])
end

Cocktail.create(name: "Whiskey Sour")
Cocktail.create(name: "Espresso Martini")
Cocktail.create(name: "Old Fashioned")
