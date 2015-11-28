json.array!(@tci) do |wspace|
  json.extract! wspace, :id, :first, :second
  json.work_space_name wspace.work_space.name
  json.closed_by wspace.closed_by.to_s
  json.close_date wspace.close_date.to_s
  json.turn_type_name wspace.turn_type.name
  json.url turn_type_url(wspace)
end
