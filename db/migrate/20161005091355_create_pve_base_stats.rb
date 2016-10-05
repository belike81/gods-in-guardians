class CreatePveBaseStats < ActiveRecord::Migration[5.0]
  def change
    create_table :pve_base_stats do |t|
      t.integer :user_id, index: true
      t.integer :kills
      t.integer :deaths
      t.decimal :kd
      t.integer :suicides
      t.integer :assists
      t.integer :most_kills
      t.timestamps
    end
  end
end
