50.times do
  User.create(username: Faker::Name.first_name, password: "1234", league_account: Faker::Name.first_name)
end
