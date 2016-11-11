class AddLastPaymentDateToDockWorker < ActiveRecord::Migration[5.0]
  def change
    add_column :dock_workers, :last_payment_date, :date
  end
end
