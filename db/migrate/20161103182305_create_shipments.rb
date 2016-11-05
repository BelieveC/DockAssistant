class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.integer :dock_worker_id
      t.integer :appointment_id

      t.timestamps
    end
  end
end
