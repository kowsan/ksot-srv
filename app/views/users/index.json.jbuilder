json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :middle_name, :last_name, :login
  json.last_sign_in_at user.last_sign_in_at
  json.last_sign_in_at_human user.last_sign_in_at.to_s
  json.ip user.last_sign_in_ip.to_s
  json.staff_role user.staff_role.name
  json.position user.position
  json.subdivision user.subdivision.name
  json.is_active user.is_active?
  json.url user_path user

end


