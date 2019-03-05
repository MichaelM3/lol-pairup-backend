class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :league_account, :preffered_role, :off_role, :rank, :user_icon
  has_many :champions
  has_many :chatrooms
  has_many :friends, through: :friendships
end
