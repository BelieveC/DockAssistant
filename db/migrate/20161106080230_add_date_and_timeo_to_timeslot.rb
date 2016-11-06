class AddDateAndTimeoToTimeslot < ActiveRecord::Migration[5.0]
  def change
  	add_column :timeslots,:date, :date
  	add_column :timeslots,:time, :time
  end
end
