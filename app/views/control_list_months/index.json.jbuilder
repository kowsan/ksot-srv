json.array!(@control_list_months) do |control_list_month|
  json.extract! control_list_month, :id, :form_date
  json.date control_list_month.form_date.to_s
  json.user_name control_list_month.author.full_name
  json.position control_list_month.author.position
  json.subdivision control_list_month.author.subdivision.name
 json.area control_list_month.author.subdivision.area.name
  json.url control_list_month_path(control_list_month)
  json.edit_url edit_control_list_month_path(control_list_month)
  json.pdf_url pdf_control_list_month_path(control_list_month,:format=> :pdf)
end
