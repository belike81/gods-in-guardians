class CreatePvpKillsWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :pvp_kills_weapons do |t|
      t.integer :user_id
      t.integer :super
      t.integer :granade
      t.integer :melee
      t.integer :auto_rifle
      t.integer :fusion
      t.integer :hand_canon
      t.integer :machine_gun
      t.integer :pulse_rifle
      t.integer :rocket_launcher
      t.integer :scout_rifle
      t.integer :shotgun
      t.integer :sniper
      t.integer :side_arm
      t.integer :sword

      t.timestamps
    end
  end
end
