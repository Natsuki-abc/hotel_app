json.extract! register, :id, :room_name, :introduction, :price, :address, :image, :created_at, :updated_at
json.url register_url(register, format: :json)
