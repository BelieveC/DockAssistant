json.extract! dock_worker, :id, :last_name, :first_name, :address, :state_id, :zipcode, :pay_rate, :archived, :created_at, :updated_at
json.url dock_worker_url(dock_worker, format: :json)