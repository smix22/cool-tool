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

puts "Creating users..."
User.create(email: "user@user.com", first_name: "Dareos", last_name: "Khalili", id: 1, password: "password")
User.create(email: "owner@owner.com", first_name: "Arbi", last_name: "Milan", id: 2, password: "password")
puts "Done!"

puts "Deleting existing tools..."
Tool.delete_all

puts "Creating categories, names, images, and cities..."
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

puts "Creating 20 fake tools..."
20.times do
  n = rand(0..9)
  category = categories[rand(0..3)]
  name = names[n]
  city = cities[rand(0..9)]
  image = images[n]
  tool = Tool.new(name: name, category: category, details: Faker::Lorem.paragraph, location: city, user_id: 2)
  file = URI.open("https://res.cloudinary.com/dbmagpuir/image/upload/#{images[n]}")
  tool.photo.attach(io: file, filename: images[n], content_type: "image/png")
  tool.save!
end
puts "Ready!"

# Tool.create(name: "Hammer", category: "handheld tool", details: "2020 Devault Hammer, with wood handle", location: "Santiago, Chile", user_id: 1, image_url:"https://imgs.search.brave.com/XNWDeUQLWuNZR0bVuv_apgiHdzhVB1ybvTH6nGff9YM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZS5zaHV0dGVyc3Rv/Y2suY29tL2ltYWdl/LXBob3RvL2hhbW1l/ci1pc29sYXRlZC1v/bi13aGl0ZS1iYWNr/Z3JvdW5kLTI2MG53/LTIwNTg2NzY0NDUu/anBn")
# Tool.create(name: "Drill", category: "house tool", details: "Red Hilti 2019 power drill", location: "Liverpool, UK", user_id: 1, image_url:"https://imgs.search.brave.com/Z3ODUQgLXtWSCj3Jxy5udIKMUw6rU_k4QWZryykQ82U/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWM1LmRlcG9zaXRw/aG90b3MuY29tLzEw/MDAyNzQvNTMwL2kv/NDUwL2RlcG9zaXRw/aG90b3NfNTMwNzQ0/Ni1zdG9jay1waG90/by1jb3JkbGVzcy1k/cmlsbC5qcGc")
# Tool.create(name: "Lawnmower", category: "garden tool", details: "100cc power Lawnmower, 2017, gasoline", location: "Hannover, Germany", user_id: 2, image_url:"https://imgs.search.brave.com/jRtOWj9oxKjtwNkqf0yuGIxKJCHeQAnB0_RmlZwTxKk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9sYXdu/LW1vd2VyLTEwMzQ0/MzAxLmpwZw")
# Tool.create(name: "Jigsaw", category: "woodwork", details: "1 meter long jigsaw for trees", location: "Berlin, Germany", user_id: 2, image_url:"https://imgs.search.brave.com/IKfDmSYnDAt9lVGFJtYsM-FzmHyYmkbmn2kywCkIer4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9lbXBp/cmUtczMtcHJvZHVj/dGlvbi5ib2J2aWxh/LmNvbS9hcnRpY2xl/cy93cC1jb250ZW50/L3VwbG9hZHMvMjAx/Ny8wNC9ERVdBTFRf/NTVBbXBfVG9wX0hh/bmRsZV9KaWdfU2F3/X0tpdC5qcGc")
