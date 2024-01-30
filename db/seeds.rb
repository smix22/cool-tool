# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: "user@user.com", first_name: "Dareos", last_name: "Khalili", id: 1, password: "password")
User.create(email: "owner@owner.com", first_name: "Arbi", last_name: "Milan", id: 2, password: "password")

Tool.create(name: "Hammer", category: "handheld tool", details: "2020 Devault Hammer, with wood handle", location: "Santiago, Chile", user_id: 1)
Tool.create(name: "Drill", category: "house tool", details: "Red Hilti 2019 power drill", location: "Liverpool, UK", user_id: 1)
Tool.create(name: "Lawnmower", category: "garden tool", details: "100cc power Lawnmower, 2017, gasoline", location: "Hannover, Germany", user_id: 2, id: 1)
Tool.create(name: "Jigsaw", category: "woodwork", details: "1 meter long jigsaw for trees", location: "Berlin, Germany", user_id: 2)
