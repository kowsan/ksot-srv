json.array!(@turn_types) do |turn_type|
  json.extract! turn_type, :id
  json.url turn_type_url(turn_type, format: :json)
end
