class AddPlatformToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :platform, :integer, default: 2
  end
end
