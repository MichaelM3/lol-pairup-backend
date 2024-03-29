require 'rest-client'
require 'json'


50.times do
  User.create(username: Faker::Internet.username, password: "123", league_account: Faker::Internet.username)
end
User.create(username: "Mike", password: "123", league_account: "Donzo Manifesto")

Chatroom.create(name: "awesome sauce", capacity: 5)
Chatroom.create(name: "flex peoples", capacity: 10)
Chatroom.create(name: "solo groups", capacity: 7)
Chatroom.create(name: "chilling", capacity: 2)
Chatroom.create(name: "very toxic peeps", capacity: 20)

ChatroomUser.create(user_id: 1, chatroom_id: 1, admin: true)
ChatroomUser.create(user_id: 2, chatroom_id: 2, admin: true)
ChatroomUser.create(user_id: 3, chatroom_id: 3, admin: true)
ChatroomUser.create(user_id: 4, chatroom_id: 4, admin: true)
ChatroomUser.create(user_id: 5, chatroom_id: 5, admin: true)
ChatroomUser.create(user_id: 6, chatroom_id: 1)
ChatroomUser.create(user_id: 7, chatroom_id: 1)
ChatroomUser.create(user_id: 8, chatroom_id: 5)
ChatroomUser.create(user_id: 9, chatroom_id: 5)
ChatroomUser.create(user_id: 10, chatroom_id: 5)
ChatroomUser.create(user_id: 11, chatroom_id: 5)
ChatroomUser.create(user_id: 12, chatroom_id: 4)
ChatroomUser.create(user_id: 13, chatroom_id: 5)
ChatroomUser.create(user_id: 14, chatroom_id: 5)
ChatroomUser.create(user_id: 15, chatroom_id: 5)
ChatroomUser.create(user_id: 16, chatroom_id: 3)
ChatroomUser.create(user_id: 17, chatroom_id: 2)
ChatroomUser.create(user_id: 18, chatroom_id: 3)
ChatroomUser.create(user_id: 19, chatroom_id: 5)
ChatroomUser.create(user_id: 20, chatroom_id: 5)
ChatroomUser.create(user_id: 21, chatroom_id: 5)
ChatroomUser.create(user_id: 22, chatroom_id: 5)
ChatroomUser.create(user_id: 23, chatroom_id: 5)

# All Champions in the game
champion_response_string = RestClient.get('http://ddragon.leagueoflegends.com/cdn/11.20.1/data/en_US/champion.json')
champion_response_hash = JSON.parse(champion_response_string)
champion_response_array = champion_response_hash["data"].to_a

def helperForImgSeach(champion)
  case champion
  when "Cho'Gath"
    "Chogath"
  when "Dr.Mundo"
    "DrMundo"
  when "Kog'Maw"
    "KogMaw"
  when "Rek'Sai"
    "RekSai"
  when "Nunu & Willump"
    "Nunu"
  when "Wukong"
    "MonkeyKing"
  else
    if champion.chars.include?(" ")
      "#{champion.delete("'. ")}"
    else
      "#{champion.delete("'.").downcase.capitalize}"
    end
  end
end

champion_response_array.each do |champion|
  Champion.create(key: champion[1]["key"].to_i, name: champion[1]["name"], img: "http://ddragon.leagueoflegends.com/cdn/11.20.1/img/champion/#{helperForImgSeach(champion[1]["name"])}.png")
end

puts "SEEDING COMPLETE"