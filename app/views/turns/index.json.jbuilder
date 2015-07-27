json.array!(@turns) do |turn|
  json.extract! turn, :id, :day_date, :first_time, :first_duration, :second_time, :second_duration, :is_dayoff
  json.url turn_url(turn, format: :json)
end
