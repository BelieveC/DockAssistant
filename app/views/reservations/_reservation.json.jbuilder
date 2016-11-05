json.extract! reservation, :id, :appointment_id, :dock_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)