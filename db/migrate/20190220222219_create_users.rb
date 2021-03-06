class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :league_account, default: "Unknown"

      t.timestamps
    end
  end
end
