json.cache! do
  json.array!(@users) do |user|
    json.extract! user, :id, :login, :first_name, :last_name, :middle_name, :is_active, :position, :staff_role_id
    json.staff_role user.staff_role, :id, :name
  end
end

