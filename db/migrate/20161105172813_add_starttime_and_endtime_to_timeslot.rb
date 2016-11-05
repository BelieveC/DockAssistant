class AddStarttimeAndEndtimeToTimeslot < ActiveRecord::Migration[5.0]
  def change
    add_column :timeslots, :starttime, :datetime
    add_column :timeslots, :endtime, :datetime
  end
end
