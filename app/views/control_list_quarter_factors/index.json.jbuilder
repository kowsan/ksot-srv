json.array!(@control_list_quarter_factors) do |control_list_quarter_factor|
  json.extract! control_list_quarter_factor, :id, :order_num, :factor, :is_active, :comment
  json.url control_list_quarter_factor_url(control_list_quarter_factor)
end
