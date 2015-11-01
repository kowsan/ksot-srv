class QfUnique < ActiveRecord::Migration
  def change
    add_index :control_list_quarter_factors, :order_num, :unique => true
    add_index :control_list_quarter_factor_groups, :order_num, :unique => true
    add_foreign_key :control_list_quarter_factors,:control_list_quarter_factor_groups
  end
end
