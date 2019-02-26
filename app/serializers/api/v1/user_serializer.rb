class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :league_account
  has_many :chatrooms
  has_many :friends, through: :friendships
end
