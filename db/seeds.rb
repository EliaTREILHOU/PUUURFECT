require 'faker'

Item.destroy_all
Order.destroy_all


i = 0
20.times do
    item = Item.create(title: Faker::Creature::Cat.name, 
    description: Faker::Lorem.paragraph, 
    price: rand(10...250),
    image_url: ("db/cat/cat#{i+=1}.png")
    )
    end
puts "item ok"

25.times do
    Order.create(
        stripe_customer_id: Faker::Code.imei
    )
end
puts "order ok"