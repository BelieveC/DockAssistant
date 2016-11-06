class AddTimeslotIdToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :timeslot_id, :integer
  end
end
