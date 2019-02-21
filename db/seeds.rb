# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Mike", password: "123", league_account: "Donzo Manifesto")
User.create(username: "Eric", password: "321", league_account: "Cerix")
# Chatroom.first.users << User.find_by(username: "Mike")
