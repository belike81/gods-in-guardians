class CreateActivityNames < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_names do |t|
      t.string :activity_hash
      t.string :activity_type_hash
      t.string :value

      t.timestamps
    end
  end
end
