# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"
require "open-uri"

puts "Deleting existing data ..."
Booking.delete_all
Tool.delete_all
User.delete_all

puts "Creating users ..."
User.create(email: "user@user.com", first_name: "Dareos", last_name: "Khalili", id: 1, password: "password")
User.create(email: "owner@owner.com", first_name: "Arbi", last_name: "Milan", id: 2, password: "password")

puts "Creating categories, names, images, and cities ..."
categories = ["handheld", "house", "garden", "woodwork"]
names = ["Hammer", "Drill", "Jigsaw", "Ladder", "Shovel", "Lawnmower", "Measuring Tape", "Screwdriver", "Scissors", "Knife"]
cities = ["Berlin", "Liverpool", "Santiago", "Paris", "Melbourne", "Copenhagen", "Milan", "Washington", "Hamburg", "Stockholm"]
images = [
  "v1706792867/hammer_hdfk8j.png",
  "v1706792858/drill_o8wqhl.png",
  "v1706792871/jigsaw_d2befc.png",
  "v1706792859/ladder_uqs0ic.png",
  "v1706792868/shovel_h4rbeb.png",
  "v1706792867/lawnmower_qbvxfc.png",
  "v1706792861/measuring_tape_wiyqmf.png",
  "v1706792870/screwdriver_fkdhax.png",
  "v1706792867/scissors_zrouxk.png",
  "v1706792863/knife_u4qrj9.png"
]

puts "Creating 20 fake tools ..."
20.times do
  n = rand(0..9)
  category = categories[rand(0..3)]
  name = names[n]
  city = cities[rand(0..9)]
  image = images[n]
  price = rand(20..60)
  tool = Tool.new(name: name, category: category, details: Faker::Lorem.paragraph(sentence_count: 4), location: city, user_id: 2, price: price)
  file = URI.open("https://res.cloudinary.com/dbmagpuir/image/upload/#{images[n]}")
  tool.photo.attach(io: file, filename: images[n], content_type: "image/png")
  tool.save!
end

puts "Ready!"
