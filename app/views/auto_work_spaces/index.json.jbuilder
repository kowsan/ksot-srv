json.array!(@unassigned) do |ws|
  json.extract! ws, :id, :uuid, :computername, :os, :os_user
  json.edit_url edit_auto_work_space_path ws
end

