# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Rachel Warbelow', email: 'demo+rachel@jumpstartlab.com', password: 'password')
User.create(name: 'Jeff Casimir', email: 'demo+jeff@jumpstartlab.com', password: 'password', display: 'j3')
User.create(name: 'Jorge Tellez', email: 'demo+jorge@jumpstartlab.com', password: 'password', display: 'novohispano')
User.create(name: 'Josh Cheek', email: 'demo+josh@jumpstartlab.com', password: 'password', display: 'josh', role: 1)
Category.create(category: 'Juice')
Category.create(category: 'Cold Drink')
Category.create(category: 'Hot Drink')
Category.create(category: 'Slush')
Category.create(category: 'Appetizers')
Category.create(category: 'Main Course')
Category.create(category: 'Burgers')
Category.create(category: 'Pasta')
Category.create(category: 'Steaks')
Category.create(category: 'Sides')
Category.create(category: 'Deserts')
