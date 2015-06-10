json.array!(@subdivisions) do |subdivision|
  json.extract! subdivision, :id
  json.url subdivision_url(subdivision, format: :json)
end
