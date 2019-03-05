class CreateChampionUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :champion_users do |t|
      t.integer :user_id
      t.integer :champion_id

      t.timestamps
    end
  end
end
