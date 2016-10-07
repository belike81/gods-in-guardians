class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :character_id
      t.string :name
      t.string :hash
      t.integer :times_completed
      t.integer :kills
      t.integer :deaths
      t.integer :assist
      t.decimal :kd
      t.integer :wins

      t.integer :seconds_played

      t.timestamps
    end
  end
end
