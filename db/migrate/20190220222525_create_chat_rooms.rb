class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
