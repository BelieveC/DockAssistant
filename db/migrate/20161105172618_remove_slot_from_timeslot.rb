class RemoveSlotFromTimeslot < ActiveRecord::Migration[5.0]
  def change
    remove_column :timeslots, :slot, :datetime
  end
end
