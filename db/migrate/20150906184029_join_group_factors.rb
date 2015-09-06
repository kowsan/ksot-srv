class JoinGroupFactors < ActiveRecord::Migration
  def change
   change_table :control_list_factors do |t|
     t.belongs_to :control_list_factor_group
   end
    add_index :control_list_factors,:order_num,:unique => true
   add_index :control_list_factor_groups,:order_num,:unique => true
  end
end
