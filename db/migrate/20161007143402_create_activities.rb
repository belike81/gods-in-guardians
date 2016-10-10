class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :character_id
      t.string :activity_name_id
      t.string :activity_hash
      t.integer :times_completed
      t.integer :kills
      t.integer :deaths
      t.integer :assists
      t.decimal :kd
      t.integer :wins

      t.integer :seconds_played

      t.timestamps
    end
  end
end
