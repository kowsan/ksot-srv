class AddAreaOwnerSubdivisionOwner < ActiveRecord::Migration
  def up
    add_column :staff_roles, :area_owner, :boolean, :default => false
    ao= StaffRole.find_by_name('Руководитель участка')
    ao.area_owner=true
    ao.save!

    add_column :staff_roles, :subdivision_owner, :boolean, :default => false
    so=StaffRole.find_by_name('Руководитель подразделения')
    so.subdivision_owner=true
    so.save!
  end
  def down
    remove_column :staff_roles, :area_owner
    remove_column :staff_roles,:subdivision_owner
  end
end
