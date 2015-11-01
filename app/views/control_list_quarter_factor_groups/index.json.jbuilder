json.array!(@control_list_quarter_factor_groups) do |control_list_quarter_factor_group|
  json.extract! control_list_quarter_factor_group, :id, :order_num, :name
  json.url control_list_quarter_factor_group_url(control_list_quarter_factor_group, format: :json)
end
