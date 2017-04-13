json.extract! appointment, :id, :datetime, :vendor_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
