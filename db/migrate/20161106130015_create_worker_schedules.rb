class CreateWorkerSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :worker_schedules do |t|
      t.integer :dock_worker_id
      t.integer :timeslot_id

      t.timestamps
    end
    add_index :worker_schedules, :dock_worker_id
    add_index :worker_schedules, :timeslot_id
  end
end
