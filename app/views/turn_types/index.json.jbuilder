json.array!(@turn_types) do |turn_type|
  json.extract! turn_type, :id, :name, :first_start_at, :first_duration, :second_start_at, :second_duration, :reminder_before_end, :is_day_off,:support2



  json.url turn_type_url(turn_type)
end
