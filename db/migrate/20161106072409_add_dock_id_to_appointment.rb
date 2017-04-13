class AddDockIdToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :dock_id, :integer
  end
end
