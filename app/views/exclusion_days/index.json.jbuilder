json.array!(@exclusion_days) do |exclusion_day|
  json.extract! exclusion_day, :id, :day
  json.url exclusion_day_url(exclusion_day, format: :json)
end
