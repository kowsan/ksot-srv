class FixOwnerSubdivision < ActiveRecord::Migration
  def up
    z= StaffRole.find_by_name("Руководитель подразделения")
    z.subdivision_owner=true
    z.save!

  end
end
