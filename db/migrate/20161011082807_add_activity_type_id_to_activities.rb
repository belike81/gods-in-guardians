class AddActivityTypeIdToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :activity_type_id, :integer
  end
end
