json.array!(@turn_types) do |turn_type|
  json.extract! turn_type, :id, :name, :first_start_at, :first_duration, :second_start_at, :second_duration, :reminder_before_end, :is_day_off, :support2

  if !turn_type.is_day_off?
    json.first_start_at_h turn_type.first_start_at.strftime('%H:%M')
    json.first_duration_h turn_type.first_duration.strftime('%H:%M')
    if turn_type.support2?
      json.second_start_at_h turn_type.second_start_at.strftime('%H:%M')
      json.second_duration_h turn_type.second_duration.strftime('%H:%M')
    else
      json.second_start_at_h '-'
      json.second_duration_h '-'
    end
    if turn_type.support2?
      json.count 2
    else
      json.count 1
    end
  end


  json.url turn_type_url(turn_type)
end
