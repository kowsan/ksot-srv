json.array!(@control_list_quarters) do |control_list_quarter|
  json.extract! control_list_quarter, :id, :form_date,:total
  json.date control_list_quarter.form_date.to_s
  json.user_name control_list_quarter.author.full_name
  json.position control_list_quarter.author.position
  json.subdivision control_list_quarter.subdivision.name
  json.area control_list_quarter.author.subdivision.area.name
  json.url control_list_quarter_path(control_list_quarter)
  json.edit_url edit_control_list_quarter_path(control_list_quarter)
  json.pdf_url pdf_control_list_quarter_path(control_list_quarter,:format=> :pdf)
end
