
  json.array!(@users) do |user|
    json.extract! user, :id,  :first_name,:middle_name ,:last_name, :login
    json.staff_role user.staff_role.name
    json.position user.position
    json.subdivision user.subdivision.name
    json.is_active user.is_active?
    json.edit_url edit_user_path user

  end


