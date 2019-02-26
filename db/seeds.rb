50.times do
  User.create(username: Faker::Name.first_name, password: "1234", league_account: Faker::Name.first_name)
end

# 50.times do
  Chatroom.create(name: "something", capacity: 10)
# end

Chatroom.first.users << User.find(1)
Chatroom.first.users << User.find(2)
Chatroom.first.users << User.find(3)
Chatroom.first.users << User.find(4)
