class CreateDockSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :dock_schedules do |t|
      t.integer :dock_id
      t.integer :timeslot_id

      t.timestamps
    end
    add_index :dock_schedules, :dock_id
    add_index :dock_schedules, :timeslot_id
  end
end
