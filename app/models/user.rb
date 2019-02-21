class User < ApplicationRecord
  has_many :messages
  has_and_belongs_to_many :chatrooms

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :rater_relationships, class_name: "Rating", foreign_key: "rater_id", dependent: :destroy

  has_many :rated_relationships, class_name: "Rating", foreign_key: "rated_id"

  has_many :raters, through: :rater_relationships, source: :rated

  has_many :rated, through: :rated_relationships, source: :rater

end
