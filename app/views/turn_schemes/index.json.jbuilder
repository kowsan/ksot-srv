json.array!(@turn_schemes) do |turn_scheme|
  json.extract! turn_scheme, :id,:name,:comment
  json.turn_type_name turn_scheme.turn_type.name
  json.url turn_scheme_url(turn_scheme)
end
