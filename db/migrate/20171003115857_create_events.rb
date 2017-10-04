class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.time :start_time
      t.integer :limit

      t.timestamps
    end
  end
end
