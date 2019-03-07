class Message < ApplicationRecord
  default_scope { order('id DESC')}
  belongs_to :user
  belongs_to :chatroom
end
