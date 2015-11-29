class AddFkMonths < ActiveRecord::Migration
  def change
    add_foreign_key :control_list_months, :subdivisions
    add_foreign_key :control_list_months, :users, column: :author_id
    add_foreign_key :control_list_month_links, :control_list_months
    add_foreign_key :control_list_month_links, :control_list_factors
    add_foreign_key :control_list_month_links, :control_list_factor_groups
    add_foreign_key :control_list_month_links, :users
    add_foreign_key :control_list_month_links, :statuses
  end
end
