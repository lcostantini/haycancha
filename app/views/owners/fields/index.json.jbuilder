json.array!(@fields) do |field|
  json.extract! field, :id, :name, :address, :telephone
  json.url field_url(field, format: :json)
end
