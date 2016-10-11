class AlterColumnTypeForActivityName < ActiveRecord::Migration[5.0]
  def change
    change_column :activities, :activity_name_id, 'integer USING activity_name_id::integer'
  end
end
