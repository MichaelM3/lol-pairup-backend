class ChampionUser < ApplicationRecord

  belongs_to :champion
  belongs_to :user

end
