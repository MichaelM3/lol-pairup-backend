class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :league_account

  has_many :friends, through: :friendships
end
