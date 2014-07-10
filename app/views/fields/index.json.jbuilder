json.array!(@fields) do |field|
  json.extract! field, :id
  json.url field_url(field, format: :json)
end
