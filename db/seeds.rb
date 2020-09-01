require 'faker'

Item.destroy_all
Order.destroy_all


i = 0
20.times do |i|
    number_photo = i + 200

    item = Item.create(title: Faker::Creature::Cat.name, 
    description: Faker::Lorem.paragraph, 
    price: rand(10...250),
    image_url: "https://placekitten.com/200/#{number_photo}"
    )
    end
puts "item ok"

25.times do
    Order.create(
        stripe_customer_id: Faker::Code.imei
    )
end
puts "order ok"

5.times do |x|
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraph,
      email: Faker::Name.first_name + "@test.com",
      password: "123456",
      password_confirmation: "123456",
      address: Faker::Address.street_address,
      zipcode: Faker::Address.zip_code,
      is_admin: false
    )
  

end