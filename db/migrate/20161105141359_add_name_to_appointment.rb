class AddNameToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :name, :string
  end
end
