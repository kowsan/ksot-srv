json.array!(@control_list_quarters) do |control_list_quarter|
  json.extract! control_list_quarter, :id, :form_date, :author_id, :subdivision_id
  json.url control_list_quarter_url(control_list_quarter, format: :json)
end
