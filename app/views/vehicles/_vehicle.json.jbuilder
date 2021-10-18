json.extract! vehicle, :id, :vehicle_id, :license_number, :vehicle_model, :location, :status, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
