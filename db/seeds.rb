
name = ['Juan', 'Pekka', 'Luula', 'Aarnio', 'Aarto']
recipe = ['salmon with potatoes', 'salmon with rice', 'saussages with potatoes', 'saussages with lettuce', 'rice with lettuce']
food = ['salmon','saussages','potatoes','lettuce', 'rice']
description = 'The description tells about the recipe and things'
price = [12, 23, 21, 14, 10, 9]

4.times do |i|
 user =  User.create(name: name[i],email:"user#{i}@asd.com", password: '123456', password_confirmation: '123456')


 4.times do |j|
    Recipe.create(user_id: user.id, name: recipe[j], preparation_time: 30, cooking_time: 80, description: description, public: true )
     Food.create(user_id: user.id, name: food[j], measurement_unit: "grames", price: 30)
 end
end

