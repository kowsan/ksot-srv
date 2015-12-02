class AddFkQuarter < ActiveRecord::Migration
  def change
    add_foreign_key :control_list_quarter_links, :control_list_quarter_factors
    add_foreign_key :control_list_quarter_links, :control_list_quarter_factor_groups
    add_foreign_key :control_list_quarter_links, :control_list_quarters
    add_foreign_key :control_list_quarter_links, :statuses
  end
end
