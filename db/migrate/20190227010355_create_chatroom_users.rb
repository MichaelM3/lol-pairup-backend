class CreateChatroomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chatroom_users do |t|
      t.integer :user_id
      t.integer :chatroom_id
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
