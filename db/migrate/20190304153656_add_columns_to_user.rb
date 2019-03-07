class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :preffered_role, :string, default: "Fill"
    add_column :users, :off_role, :string, default: "Fill"
    add_column :users, :rank, :string, default: "Unknown"
    add_column :users, :summoner_id, :string
    add_column :users, :user_icon, :string
  end
end
