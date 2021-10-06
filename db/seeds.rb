# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup)
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Rachel Warbelow', email: 'demo+rachel@jumpstartlab.com', password: 'password')
User.create!(name: 'Jeff Casimir', email: 'demo+jeff@jumpstartlab.com', password: 'password', display_name: 'j3')
User.create!(name: 'Jorge Tellez', email: 'demo+jorge@jumpstartlab.com', password: 'password', display_name: 'novohispano')
User.create!(name: 'Josh Cheek', email: 'demo+josh@jumpstartlab.com', password: 'password', display_name: 'josh', role: 1)
Category.create!(category: 'Drinks')
Category.create!(category: 'Juice')
Category.create!(category: 'Hot Drinks')
Category.create!(category: 'Cold Drinks')
Category.create!(category: 'Appetizers')
Category.create!(category: 'Main Course')
Category.create!(category: 'Sides')
Category.create!(category: 'Deserts')
drinks = Category.find_by(category: 'Drinks')
juice = Category.find_by(category: 'Juice')
hot_drinks = Category.find_by(category: 'Hot Drinks')
cold_drinks = Category.find_by(category: 'Cold Drinks')
appetizers = Category.find_by(category: 'Appetizers')
main_course = Category.find_by(category: 'Main Course')
sides = Category.find_by(category: 'Sides')
deserts = Category.find_by(category: 'Deserts')

item = Item.new(title: 'Water Melon Juice',
                description: 'Refreshing Fresh Juice',
                price: 1.99,
                category_ids: [drinks.id, juice.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/watermelon.jpg').to_s),
                    filename: 'watermelon.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Coffee',
                description: 'get your daily caffeine',
                price: 3.99,
                category_ids: [drinks.id, hot_drinks.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/coffee.jpeg').to_s),
                    filename: 'coffee.jpeg',
                    content_type: 'image/jpeg')
item.save!

item = Item.new(title: 'Coca Cola',
                description: 'Refreshing caffeinated beverage',
                price: 1.50,
                category_ids: [drinks.id, cold_drinks.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/coca_cola.jpg').to_s),
                    filename: 'coca_cola.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Sprite',
                description: 'Refreshing caffeinated beverage',
                price: 1.50,
                category_ids: [drinks.id, cold_drinks.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/sprite.jpeg').to_s),
                    filename: 'sprite.jpeg',
                    content_type: 'image/jpeg')
item.save!

item = Item.new(title: 'Fanta',
                description: 'Refreshing caffeinated beverage',
                price: 1.50,
                category_ids: [drinks.id, cold_drinks.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/fanta.jpg').to_s),
                    filename: 'fanta.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Sweet Potato Crostini',
                description: 'With Prosciutto Honey Roasted Figs',
                price: 6.99,
                category_ids: [appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/sweet.jpg').to_s),
                    filename: 'sweet.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Jalapeno Popper Cheese Balls',
                description: 'Fried with Bacon & Chives',
                price: 9.99, category_ids: [appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/cheese.jpg').to_s),
                    filename: 'cheese.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Soft Pretzel Bites',
                description: 'with Gooey Cheddar Queso',
                price: 7.99,
                category_ids: [appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/pretzel.jpg').to_s),
                    filename: 'pretzel.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Chicken Wings',
                description: 'Crispy Baked with Salt and Pepper',
                price: 10.99,
                category_ids: [appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/wings.jpg').to_s),
                    filename: 'wings.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Buffalo Chicken Wings',
                description: 'Fried and drenched in Buffalo sauce',
                price: 10.99,
                category_ids: [appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/buffalo.jpg').to_s),
                    filename: 'buffalo.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Zucchini Chips',
                description: 'Crispy and Baked',
                price: 4.99,
                category_ids: [appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/zucchini.jpg').to_s),
                    filename: 'zucchini.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Sundried Tomato Garlic Butter Bruschetta',
                description: 'No idea what this is, but souund expensive',
                price: 12.99,
                category_ids: [appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/tomato.jpg').to_s),
                    filename: 'tomato.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Beetroot and Feta Cheese Salad',
                description: 'Its beetroot salat ok?',
                price: 6.99,
                category_ids: [appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/beetroot.jpg').to_s),
                    filename: 'beetroot.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Cedar-Plank Salmon',
                description: 'A big salmon fillet',
                price: 17.99,
                category_ids: [main_course.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/salmon.jpg').to_s),
                    filename: 'salmon.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Braised Chicken Legs',
                description: 'With Grapes and Fennel',
                price: 14.99,
                category_ids: [main_course.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/chicken.jpg').to_s),
                    filename: 'chicken.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Seared Scallops',
                description: 'With Brown Butter and Lemon Pan Sauce',
                price: 20.99,
                category_ids: [main_course.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/scallops.jpg').to_s),
                    filename: 'scallops.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Grilled Pizza',
                description: 'Its just pizza but expensive',
                price: 19.99,
                category_ids: [main_course.id, appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/pizza.jpg').to_s),
                    filename: 'pizza.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Double-Stack Mushroom and Chicken Cheeseburgers',
                description: 'Its an epic looking but expensive burger',
                price: 15.99,
                category_ids: [main_course.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/burger.jpg').to_s),
                    filename: 'burger.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Baked Macaroni and Cheese',
                description: 'Mac and Cheese Yo',
                price: 12.99,
                category_ids: [sides.id, appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/mac.jpg').to_s),
                    filename: 'mac.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Simple Biscuits',
                description: 'buttery, simple biscuit',
                price: 7.99,
                category_ids: [sides.id, appetizers.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/biscuit.jpg').to_s),
                    filename: 'biscuit.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Coleslaw',
                description: 'A side for your meal',
                price: 5.99,
                category_ids: [sides.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/coleslaw.jpg').to_s),
                    filename: 'coleslaw.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Giant Fruit Danish',
                description: 'Simple, delicious, and pairs perfectly with coffee or tea!',
                price: 12.99,
                category_ids: [deserts.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/danish.jpg').to_s),
                    filename: 'danish.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Ice Cream',
                description: 'Its Fried',
                price: 12.99,
                category_ids: [deserts.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/icecream.jpg').to_s),
                    filename: 'icecream.jpg',
                    content_type: 'image/jpg')
item.save!

item = Item.new(title: 'Samoa Dessert Lasagna',
                description: 'Yes you read that right!',
                price: 13.99,
                category_ids: [deserts.id])

item.picture.attach(io: File.open(Rails.root.join('app/assets/images/lasagna.jpg').to_s),
                    filename: 'lasagna.jpg',
                    content_type: 'image/jpg')
item.save!
