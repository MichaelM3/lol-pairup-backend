class Champion < ApplicationRecord

  has_many :champion_users, dependent: :destroy
  has_many :users, through: :champion_users

end
