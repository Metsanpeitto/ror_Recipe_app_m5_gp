name = ['Juan', 'Pekka', 'Luula', 'Aarnio', 'Aarto']
recipe = ['salmon with potatoes', 'salmon with rice', 'saussages with potatoes', 'saussages with lettuce', 'rice with lettuce']
food = ['salmon','saussages','potatoes','lettuce', 'rice']
description = 'The description tells about the recipe and things'

user =  User.create(name: name[0],email:"user0@asd.com", password: '123456', password_confirmation: '123456')

salmon =    Food.create(user_id: user.id, name: food[0], measurement_unit: "grams", price: 10)
saussages =    Food.create(user_id: user.id, name: food[1], measurement_unit: "grams", price: 10)
potatoes =    Food.create(user_id: user.id, name: food[2], measurement_unit: "grams", price: 10)
lettuce =    Food.create(user_id: user.id, name: food[3], measurement_unit: "grams", price: 10)
rice =    Food.create(user_id: user.id, name: food[4], measurement_unit: "grams", price: 10)

 salmon_potatoes = Recipe.create(user_id: user.id, name: recipe[0], preparation_time: 30, cooking_time: 80, description: description, public: true )
 RecipeFood.create(recipe: salmon_potatoes, food: salmon , quantity: 3)
 RecipeFood.create(recipe: salmon_potatoes, food: potatoes , quantity: 3)

 salmon_rice = Recipe.create(user_id: user.id, name: recipe[1], preparation_time: 30, cooking_time: 80, description: description, public: true )
 RecipeFood.create(recipe: salmon_rice, food: salmon , quantity: 3)
 RecipeFood.create(recipe: salmon_rice, food: rice , quantity: 3)

saussages_potatoes = Recipe.create(user_id: user.id, name: recipe[2], preparation_time: 30, cooking_time: 80, description: description, public: true )
 RecipeFood.create(recipe: saussages_potatoes, food: saussages , quantity: 3)
 RecipeFood.create(recipe: saussages_potatoes, food: potatoes , quantity: 3)

 saussages_lettuce = Recipe.create(user_id: user.id, name: recipe[3], preparation_time: 30, cooking_time: 80, description: description, public: true )
 RecipeFood.create(recipe: saussages_lettuce, food: saussages , quantity: 3)
 RecipeFood.create(recipe: saussages_lettuce, food: lettuce , quantity: 3)

 rice_lettuce = Recipe.create(user_id: user.id, name: recipe[4], preparation_time: 30, cooking_time: 80, description: description, public: true )
 RecipeFood.create(recipe: rice_lettuce, food: rice , quantity: 3)
 RecipeFood.create(recipe: rice_lettuce, food: lettuce , quantity: 3)