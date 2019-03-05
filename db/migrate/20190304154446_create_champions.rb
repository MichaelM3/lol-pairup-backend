class CreateChampions < ActiveRecord::Migration[5.2]
  def change
    create_table :champions do |t|
      t.integer :key
      t.string :name
      t.string :img

      t.timestamps
    end
  end
end
