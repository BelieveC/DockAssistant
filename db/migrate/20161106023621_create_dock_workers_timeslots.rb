class CreateDockWorkersTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :dock_workers_timeslots, id: false do |t|
      t.integer :dock_worker_id
      t.integer :timeslot_id
    end
    add_index :dock_workers_timeslots, [:dock_worker_id, :timeslot_id]
  end
end
