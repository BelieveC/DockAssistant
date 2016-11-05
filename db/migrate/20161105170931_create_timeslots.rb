class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.datetime :slot

      t.timestamps
    end
  end
end
