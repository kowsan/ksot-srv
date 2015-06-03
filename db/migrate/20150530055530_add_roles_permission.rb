class AddRolesPermission < ActiveRecord::Migration
  def change

    # users  permission

    add_column :staff_roles, :can_add_issue, :boolean, :default => false
    add_column :staff_roles, :can_edit_issue, :boolean, :default => false
    add_column :staff_roles, :can_change_issue_status, :boolean, :default => false
    add_column :staff_roles, :can_shutdown_app, :boolean, :default => false
    add_column :staff_roles, :can_view_issue_report_local, :boolean, :default => false


    #staff owner permission
    add_column :staff_roles, :can_view_employees_list, :boolean, :default => false
    add_column :staff_roles, :can_view_issue_report_owned, :boolean, :default => false
    add_column :staff_roles, :can_view_aws_list_owned, :boolean, :default => false
    add_column :staff_roles, :can_view_work_changes_owned,:boolean,:default => false
    add_column :staff_roles, :can_fill_control_list,:boolean,:default => false






  end
end
