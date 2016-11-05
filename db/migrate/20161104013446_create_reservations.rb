class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :appointment_id
      t.integer :dock_id

      t.timestamps
    end
  end
end
