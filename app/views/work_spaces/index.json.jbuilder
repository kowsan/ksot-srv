json.array!(@work_spaces) do |work_space|
  json.extract! work_space, :id
  json.url work_space_url(work_space, format: :json)
end
