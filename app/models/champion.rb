class Champion < ApplicationRecord

  has_many :champion_users
  has_many :users, through: :champion_users

end
