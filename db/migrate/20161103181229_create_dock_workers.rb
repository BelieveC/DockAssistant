class CreateDockWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :dock_workers do |t|
      t.string :last_name
      t.string :first_name
      t.string :address
      t.integer :state_id
      t.string :zipcode
      t.float :pay_rate
      t.boolean :archived

      t.timestamps
    end
  end
end
