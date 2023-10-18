# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avater_url: Faker::Avatar.image,
    email: Faker::Internet.email,
    password: "123456"
  )

  # Création d'une adresse pour chaque utilisateur
  address = Address.create!(
    user: user,
    city: Faker::Address.city,
    country: Faker::Address.country,
    line_1: Faker::Address.street_address,
    line_2: Faker::Address.secondary_address,
    postal_code: Faker::Address.zip_code,
    state: Faker::Address.state,
    phone: Faker::PhoneNumber.phone_number,
    comment: Faker::Lorem.sentence(word_count: 5)
  )

  # Création d'un slot pour chaque utilisateur
  Slot.create!(
    day: Faker::Date.forward(days: 30).strftime("%A"),
    start_hour: "#{rand(1..12)}:00 #{['AM', 'PM'].sample}",
    end_hour: "#{rand(1..12)}:00 #{['AM', 'PM'].sample}",
    address: address
  )
end
