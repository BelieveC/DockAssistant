class Shipment < ApplicationRecord
  belongs_to :dock_worker
  belongs_to :appointment
end
