class AddMoreStatsToPvPBase < ActiveRecord::Migration[5.1]
  def change
    add_column :pvp_base_stats, :games, :integer
    add_column :pvp_base_stats, :kills_assists, :decimal
  end
end
