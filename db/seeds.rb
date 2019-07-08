# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
dan = User.new(
    name: "Dan Waldkirch",
    email: "djwaldkirch@gmail.com",
    password: "kickball",
    password_confirmation: "kickball",
)
dan.save!

cam = User.new(
    name: "Cameron Elkin",
    email: "cameron_elkin@yahoo.com",
    password: "kickball",
    password_confirmation: "kickball",
)
cam.save!


print "Seeded with Leg Day!"
