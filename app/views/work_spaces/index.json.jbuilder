json.array!(@work_spaces) do |work_space|
  json.extract! work_space, :id,:name,:code,:short_name,:is_active

  json.turn_scheme work_space.turn_scheme.name
  json.subdivision work_space.subdivision.name
  json.is_empty work_space.auto_work_spaces.count>0
  json.issue_types work_space.issue_types do  |i|
    json.issue_type i.name
  end
  json.url work_space_url(work_space)
end
