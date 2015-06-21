json.cache! do
  json.array!(@auto_work_spaces) do |auto_work_space|
    json.extract! auto_work_space, :id, :uuid, :computername

  end

  json.array!(@unassigned) do |ws|
    json.extract! ws, :id, :uuid, :computername
  end
end
