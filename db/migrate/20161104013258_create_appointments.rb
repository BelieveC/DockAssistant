class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :datetime
      t.integer :vendor_id

      t.timestamps
    end
  end
end
