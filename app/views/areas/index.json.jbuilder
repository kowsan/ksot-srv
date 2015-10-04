json.array!(@areas) do |area|
  json.extract! area, :id,:name,:short_name
  json.management_name area.management.name
  json.url area_url(area)
end
