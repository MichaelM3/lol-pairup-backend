class Api::V1::ChatroomSerializer < ActiveModel::Serializer
  attributes :id, :name, :capacity
  has_many :chatroom_users
  has_many :users
  has_many :messages
end
