class AddEventIdToEventUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :event_users, :event_id, :integer
  end
end
