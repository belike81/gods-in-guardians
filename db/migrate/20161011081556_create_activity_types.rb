class CreateActivityTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_types do |t|
      t.string :activity_type_hash
      t.string :identifier
      t.string :value

      t.timestamps
    end
  end
end
