json.extract! booking, :id, :date, :time_starts, :time_finishes, :number_of_dogs, :owner_id, :sitter_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
