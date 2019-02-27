class ChatroomUser < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validate :chatroom_capacity

  def count_users
    self.chatroom.users.count
  end

  def chatroom_capacity
    if count_users >= self.chatroom.capacity
      errors.add(:chatroom_users, "capacity has been reached")
    end
  end
end
