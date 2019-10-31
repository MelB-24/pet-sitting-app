json.extract! dog, :id, :name, :breed, :date_of_birth, :microchip_number, :bio, :sex, :owner_id, :created_at, :updated_at
json.url dog_url(dog, format: :json)
