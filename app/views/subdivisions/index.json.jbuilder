json.array!(@subdivisions) do |subdivision|
  json.extract! subdivision, :id,:name,:short_name
  json.area_name subdivision.area.name
  json.url subdivision_url(subdivision)
end
