class AddManageOrgStructure < ActiveRecord::Migration
  def change
    add_column :staff_roles,:can_manage_org_structure,:boolean,:default => false

  end
end
