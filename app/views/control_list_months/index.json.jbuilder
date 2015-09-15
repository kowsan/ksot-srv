json.array!(@control_list_months) do |control_list_month|
  json.extract! control_list_month, :id, :form_date
  json.url control_list_month_url(control_list_month, format: :json)
end
