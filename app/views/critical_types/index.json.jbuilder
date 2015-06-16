json.array!(@critical_types) do |critical_type|
  json.extract! critical_type, :id, :name
  json.url critical_type_url(critical_type, format: :json)
end
