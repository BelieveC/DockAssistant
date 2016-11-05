json.extract! shipment, :id, :dock_worker_id, :appointment_id, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)