class RemoveStartTimeAndEndTimeFromTimeslot < ActiveRecord::Migration[5.0]
  def change
  	remove_column :timeslots,:starttime,:datetime
  	remove_column :timeslots,:endtime,:datetime
  end
end
