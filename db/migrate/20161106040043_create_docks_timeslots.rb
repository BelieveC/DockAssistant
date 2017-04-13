class CreateDocksTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :docks_timeslots, id: false do |t|
      t.integer :dock_id
      t.integer :timeslot_id
    end
    add_index :docks_timeslots, [:dock_id, :timeslot_id]
  end
end
