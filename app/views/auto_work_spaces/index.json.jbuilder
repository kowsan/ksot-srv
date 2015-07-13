json.unassigned do
  json.array!(@unassigned) do |ws|
    json.extract! ws, :id, :uuid, :computername, :os, :os_user
    json.edit_url edit_auto_work_space_path ws
  end
end

json.assigned do
  json.array!(@auto_work_spaces) do |ws|
    json.extract! ws, :id, :uuid, :computername, :os, :os_user,:short_name,:comment,:location
    json.updated_at (ws.updated_at+Time.now.utc_offset).strftime("%d.%m.%Y %H:%M")
    json.edit_url edit_auto_work_space_path ws
  end
end


