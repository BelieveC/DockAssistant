class DropDocksTimeslots < ActiveRecord::Migration[5.0]
  def change
  	drop_table :docks_timeslots
  	drop_table :dock_workers_timeslots
  end
end
