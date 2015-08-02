json.array!(@turn_schemes) do |turn_scheme|
  json.extract! turn_scheme, :id
  json.url turn_scheme_url(turn_scheme, format: :json)
end
