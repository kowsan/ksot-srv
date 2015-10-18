json.array!(@control_list_factors) do |control_list_factor|
  json.extract! control_list_factor, :id, :order_num, :factor, :is_active, :comment
  json.facgroup control_list_factor.control_list_factor_group.name

  json.url control_list_factor_url(control_list_factor)
end
