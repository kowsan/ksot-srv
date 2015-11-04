json.array!(@control_list_quarter_factor_groups) do |control_list_quarter_factor_group|
  json.extract! control_list_quarter_factor_group, :id, :order_num, :name
  json.f_count control_list_quarter_factor_group.control_list_quarter_factors.count
  json.url control_list_quarter_factor_group_url(control_list_quarter_factor_group)
end
