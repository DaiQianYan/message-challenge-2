# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  [
    {name: "Dafeng", email: "dafeng@strikingly.com", password: "password"},
    {name: "Daniel", email: "daniel@strikingly.com", password: "password"},
    {name: "Joyce", email: "joyce@strikingly.com", password: "password"},
    {name: "Tyler", email: "tyler@strikingly.com", password: "password"},
    {name: "Xiaoyu", email: "xiaoyu@strikingly.com", password: "password"},
    {name: "Batman", email: "batman@strikingly.com", password: "password"}
  ]
)