class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  # validates :password, presence: true
  validates :league_account, uniqueness: true

  has_many :champion_users
  has_many :champions, through: :champion_users
  has_many :messages
  has_many :chatroom_users, dependent: :destroy
  has_many :chatrooms, through: :chatroom_users

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :rater_relationships, class_name: "Rating", foreign_key: "rater_id", dependent: :destroy

  has_many :rated_relationships, class_name: "Rating", foreign_key: "rated_id"

  has_many :raters, through: :rater_relationships, source: :rated

  has_many :rated, through: :rated_relationships, source: :rater

end
